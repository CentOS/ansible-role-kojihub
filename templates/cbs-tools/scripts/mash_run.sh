usage()
{
cat << EOF
usage: $0 [-t <tag(s)>]

This script generate mash repo from all SIG tags.

OPTIONS:
   -d          mash repo destination : default to $MASH_DEST
   -f          koji instance fqdn : default to $KOJI_FQDN
   -t          tag(s) : storage7-release, storage7-testing etc...
EOF
}

# Global config
# koji binary
KOJI="/usr/bin/koji"
# mash binary
MASH="/usr/bin/mash"
# default fqdn
KOJI_FQDN="cbs.centos.org"
# mash config containing mash.conf
MASH_CONF="/etc/mash"
# repos destination
MASH_DEST="/mnt/kojishare/repos"
#cache
MASH_CACHE="/var/cache/cbs-mash"
# log directory
LOG_DIR="/var/log/mash"
# End Global

optiond=false
optionf=false
optiont=false
optionv=false

while getopts ":hvd:f:t:" OPTION
do
	case ${OPTION} in
    h)
             usage
             exit 0
             ;;
	t)
             optiont=true
             TAGS="${OPTARG}"
             ;;
	d)
             optiond=true
             MASH_DEST="${OPTARG}"
             ;;
	f)
             optionf=true
             KOJI_FQDN="${OPTARG}"
             ;;
	v)
	         optionv=true
	         ;;
    ?)
             exit 0
             ;;
    :)
             echo "Option -${OPTARG} requires an argument."
             exit 1
             ;;
    esac
done

shift $((${OPTIND} - 1))

# Repoviewurl in mash config
MASH_VIEWURL="http://$KOJI_FQDN/repos"

# Check if user is allowed to send command to koji and has 'admin' permission
PERMS=`${KOJI} list-permissions --mine`

for P in $PERMS
do
    [[ $P == 'admin' ]] && ADMIN=true && break
done

if [ "$ADMIN" != true ]
then
	echo "[ERROR] Koji misconfigure/missing admin privilege for creating SIG tags"
	exit 1
fi

if ( ! ${optiont} )
then
	CANDIDATE_TAGS=`${KOJI} list-tags | grep "\-candidate"`
	TEST_TAGS=`${KOJI} list-tags | grep "\-testing"`
	RELEASE_TAGS=`${KOJI} list-tags | grep "\-release"`
	PENDING_TAGS=`${KOJI} list-tags | grep "\-pending"`
	TAGS="${CANDIDATE_TAGS} ${TEST_TAGS} ${RELEASE_TAGS} ${PENDING_TAGS}"
fi

print_mash_template()
{
	local tag=$1
	local arches=$2
cat << EOF
[${tag}]
rpm_path = ${MASH_DEST}/${tag}/%(arch)s/os/Packages
repodata_path = ${MASH_DEST}/${tag}/%(arch)s/os/
source_path = source/SRPMS
debuginfo = True
multilib = False
multilib_method = devel
tag = ${tag}
inherit = False
strict_keys = False
repoviewurl = ${MASH_VIEWURL}/${tag}/%(arch)s/os/
repoviewtitle = "${tag^^}"
arches = ${arches}
delta = True
EOF
}

mash_prepare ()
{
	local tag=$1
	local log=$2
	local arches=$3
	local conf=`mktemp`
	( $optionv ) && echo "* Checking ${tag} mash config..."
	# config mash already ok
	( $optionv ) && echo " -> [INFO] creating mash config: ${tag}.mash..."
	print_mash_template "${tag}" "${arches}" > $conf
	[ -f ${MASH_CONF}/${tag}.mash ] && diff ${MASH_CONF}/${tag}.mash $conf &>> $log
	if [ $? -gt 0 ]
	then
		( $optionv ) && echo " -> [INFO] updating mash config ${tag}.mash"
		mv $conf ${MASH_CONF}/${tag}.mash
		( $optionv ) && echo " -> [INFO] cleaning mash cache ${tag}.buildlist"
        [ -f $MASH_CACHE/${tag}.buildlist ] && rm $MASH_CACHE/${tag}.buildlist
	else
		rm $conf
	fi
}

mash_run () {
	local tag=$1
	local log=$2
	${MASH} -p ${MASH_DEST}/ -o ${MASH_DEST}/ ${tag} &> ${log}
	if [ $? -gt 0 ] 
	then
		echo " -> [ERROR] mash run failed ${log}"
		[ -f ${MASH_CACHE}/${tag}.buildlist ] && rm -rf $MASH_CACHE/${tag}.buildlist
	fi
	( $optionv ) && echo " -> [INFO] mash run succeeded ${log}"
}

# Ensure the cache directory is available
[ ! -d $MASH_CACHE ] && mkdir -p $MASH_CACHE

if ( ! ${optiont} )
then
	# Ensure we do not have parallel runs
	pidfile=/var/tmp/mash-run.pid
	if [ -e $pidfile ]; then
		pid=`cat $pidfile`
		if kill -0 &> /dev/null $pid; then
			( $optionv ) && echo "Mash is already running PID:$pid"
			exit 1
		else
			rm $pidfile &>/dev/null
		fi
	fi
	echo $$ > $pidfile
fi

# Cache target list as it cannot include unknown tag at this point
TARGETS=`mktemp`
${KOJI} list-targets --quiet > $TARGETS

for TAG in ${TAGS}
do
	( $optionv ) && echo "Checking $TAG ..."
	ARCHES=""
	BUILDTAG=""
	LOG="${LOG_DIR}/mash.${TAG}.log"
	if [[ $TAG = *"infrastructure"* ]]
	then
		FAKETAG=${TAG/release/testing}
	else
		FAKETAG=${TAG/testing/candidate}
		FAKETAG=${FAKETAG/release/candidate}
	fi
	BUILDTAG=`grep ${FAKETAG} ${TARGETS} | awk '{print $2}'`
	[ ! -z "$BUILDTAG" ] && ARCHES=`${KOJI} taginfo ${BUILDTAG} | grep Arches | cut -d ":" -f 2-`
	[ -z "$ARCHES" ] && ARCHES="x86_64"
	# Mash not happy with i686 wants i386
	ARCHES=${ARCHES/i686/i386}
	mash_prepare "${TAG}" "${LOG}" "${ARCHES}"
	if [ ! -f $MASH_CACHE/$TAG.buildlist ]
	then
        	${KOJI} list-tagged $TAG > $MASH_CACHE/$TAG.buildlist
	else
		BUILDLIST=`mktemp`
		${KOJI} list-tagged $TAG > $BUILDLIST
		diff $BUILDLIST $MASH_CACHE/$TAG.buildlist &>> $LOG
		if [ $? -eq 0 ]
		then
			echo " -> skipping. No new build in $TAG" &>> $LOG
			[ -f $BUILDLIST ] &&  rm -rf $BUILDLIST
			continue
		else
			echo " -> updating cache for $TAG" &>> $LOG
			cp $BUILDLIST $MASH_CACHE/$TAG.buildlist
		fi
		[ -f $BUILDLIST ] &&  rm -rf $BUILDLIST
	fi
	mash_run "${TAG}" "${LOG}" &
done

wait
( ! $optiont ) && rm $pidfile
exit 0
