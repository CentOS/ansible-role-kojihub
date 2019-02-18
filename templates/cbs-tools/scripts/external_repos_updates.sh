#!/bin/bash

REPOMD="repodata/repomd.xml"

KOJI_CACHE="/var/cache/cbs-monitorexternalrepos"
UPDATED_REPOS=""
UPDATED_BUILDROOTS=`mktemp`
SUPPORTED_ARCHES="x86_64 i386 ppc64le aarch64"

# Ensure the cache directory is available
[ ! -d $KOJI_CACHE ] && mkdir -p $KOJI_CACHE

OLDIFS="$IFS"
IFS=$'\n'
for REPO in `koji list-external-repos --quiet`
do
	IFS="$OLDIFS"
	for ARCH in $SUPPORTED_ARCHES
	do
		httpcode=""
		sha=""
		oldsha=""
		eval repourl=`echo $REPO | rev| cut -d ' ' -f 1| rev | sed 's#\$arch#$ARCH#g'`
		reponame=`echo $REPO | cut -d ' ' -f 1`
		if [ "x$reponame" == "x" ]
		then
			echo "Repository $REPO is malformed."
			break
		fi
		httpcode=$(curl -s --head -w %{http_code} $repourl -o /dev/null)
		if [ $? -gt 0 ]
		then
			echo "[WARN] Couldn't retrieve $repourl . Skipping $reponame regeneration."
			continue
		else
			httpcode=$(( httpcode + 0 ))
			if [ $httpcode -gt 400 ]
			then
				echo "[INFO] Skipping $reponame.$ARCH ; $ARCH not available."
				continue
			else
				sha=`curl --silent $repourl/$REPOMD | sha256sum`
				if [ $? -gt 0 ]
				then
					echo "Couldn't retrieve $repourl/$REPOMD. Skipping $reponame regeneration."
					continue
				fi
				if [ ! -f $KOJI_CACHE/$reponame.$ARCH.sha256sum ]
				then
					echo "$sha" > $KOJI_CACHE/$reponame.$ARCH.sha256sum
					UPDATED_REPOS="$UPDATED_REPOS $reponame"
				else
					oldsha=`cat $KOJI_CACHE/$reponame.$ARCH.sha256sum`
					diff <(echo "$sha") <(echo "$oldsha") &> /dev/null
					if [ $? -gt 0 ]
					then
						echo "in"
						UPDATED_REPOS="$UPDATED_REPOS $reponame"
						echo "$sha" > $KOJI_CACHE/$reponame.$ARCH.sha256sum
					fi
				fi
			fi
		fi
	done
done
IFS="$OLDIFS"

for REPO in $UPDATED_REPOS
do
    buildroots=`koji list-external-repos --name=$REPO --quiet --used | cut -d ' ' -f 1`
    printf "$buildroots\n" >> $UPDATED_BUILDROOTS 
done

for BR in `cat $UPDATED_BUILDROOTS | sort | uniq`
do
    echo koji regen-repo --nowait $BR
done

