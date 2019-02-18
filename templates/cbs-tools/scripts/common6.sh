SIG=storage
DIST=6
DISTTAG=el6

koji add-tag --arches "x86_64" $SIG$DIST-common-el6-build
koji add-tag $SIG$DIST-common-candidate
koji add-tag $SIG$DIST-common-testing
koji add-tag $SIG$DIST-common-release
koji add-target $SIG$DIST-common-el6 $SIG$DIST-common-el6-build $SIG$DIST-common-candidate
koji add-external-repo --tag=$SIG$DIST-common-el6-build centos6-updates
koji add-external-repo --tag=$SIG$DIST-common-el6-build centos6-os
koji add-group  $SIG$DIST-common-el6-build build
koji add-group  $SIG$DIST-common-el6-build srpm-build
koji add-group-pkg $SIG$DIST-common-el6-build build bash bzip2 coreutils cpio diffutils redhat-release findutils gawk gcc gcc-c++ grep gzip info make patch redhat-rpm-config rpm-build sed shadow-utils tar unzip util-linux-ng which buildsys-macros-$DISTTAG  tar buildsys-tools
koji add-group-pkg $SIG$DIST-common-el6-build srpm-build srpm-build bash buildsys-macros curl cvs redhat-release gnupg make redhat-rpm-config rpm-build shadow-utils buildsys-macros-$DISTTAG tar buildsys-tools
koji add-tag-inheritance --priority 5 $SIG$DIST-common-el6-build  buildsys$DIST
koji add-tag-inheritance --priority 10 $SIG$DIST-common-el6-build  $SIG$DIST-common-candidate
