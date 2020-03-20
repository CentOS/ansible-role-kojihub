KOJI="/usr/bin/koji"
URLS=http://composes.rdu2.centos.org/CentOS-Stream-20191210.n.0/compose/
URLX=http://composes.rdu2.centos.org/CentOS-Stream-20191210.n.0/compose/
BUILDROOT_DEFAULT="curl bash bzip2 coreutils cpio diffutils redhat-release findutils gawk gcc gcc-c++ grep gzip info make patch redhat-rpm-config rpm-build sed shadow-utils tar unzip util-linux-ng which buildsys-tools tar"

create_tag () {
	local name="$1"
	local arches="$2"
	local disttag="$3"
	local dist="$4" # s or x
	$KOJI remove-tag ${name}-build
	$KOJI add-tag --arches "${arches}" ${name}-build
	$KOJI add-external-repo --tag=${name}-build centos8${dist}-cr --mode bare
	$KOJI add-external-repo --tag=${name}-build centos8${dist}-powertools --mode bare 
	$KOJI add-external-repo --tag=${name}-build centos8${dist}-appstream --mode bare
	$KOJI add-external-repo --tag=${name}-build centos8${dist}-baseos  --mode bare
	$KOJI add-tag --arches "${arches}" ${name}-candidate 2> /dev/null # never delete destination tags with content 
	$KOJI add-tag --arches "${arches}" ${name}-testing 2> /dev/null # never delete destination tags with content
	$KOJI add-tag --arches "${arches}" ${name}-release  2> /dev/null # never delete destination tags with content
	$KOJI add-group ${name}-build build
	$KOJI add-group ${name}-build srpm-build
	$KOJI add-group-pkg ${name}-build build $BUILDROOT_DEFAULT
	$KOJI add-group-pkg ${name}-build srpm-build $BUILDROOT_DEFAULT
	$KOJI add-target ${name} ${name}-build ${name}-candidate
	$KOJI edit-tag ${name}-build --extra="mock.package_manager=dnf"
	$KOJI edit-tag ${name}-build --extra="mock.new_chroot=1"
	$KOJI regen-repo --nowait ${name}-build
}

add_or_update_repo () {
	local name="$1"
	local url="$2"
	$KOJI edit-external-repo $name --name $name 2>/dev/null
	if [ $? -gt 0 ]
	then
		$KOJI add-external-repo "$name" "$url"
	else
		$KOJI edit-external-repo $name --url="$url"
	fi
}

add_or_update_repo "centos8s-appstream" "$URLS/AppStream/\$arch/os/"
add_or_update_repo "centos8s-baseos" "$URLS/BaseOS/\$arch/os/"
add_or_update_repo "centos8s-powertools" "$URLS/PowerTools/\$arch/os/"
add_or_update_repo "centos8s-cr" "$URLS/CR/\$arch/os/"

add_or_update_repo "centos8x-appstream" "$URLX/AppStream/\$arch/os/"
add_or_update_repo "centos8x-baseos" "$URLX/BaseOS/\$arch/os/"
add_or_update_repo "centos8x-powertools" "$URLX/PowerTools/\$arch/os/"
add_or_update_repo "centos8x-cr" "$URLX/CR/\$arch/os/"

#create_tag "buildsys8" "x86_64 aarch64 ppcle64" "el8" "s"
create_tag "buildsys8" "x86_64 aarch64 ppc64le" "el8" "x"
create_tag "test8" "x86_64" "el8" "x"
