#! /bin/bash

# Starting w/ Rocky release, Cloud SIG OpenStack do not use common tag anymore
# For compatibility with existing build targets, we explicitly inherit common tag

declare -a RELEASES
RELEASES=("juno" "kilo" "liberty" "mitaka" "newton" "ocata" "pike")
for release in ${RELEASES[@]}; do
    koji add-tag-inheritance --priority 15 \
            cloud7-openstack-$release-el7-build cloud7-openstack-common-candidate
done

# Specific for EL6 (only one release)
koji add-tag-inheritance --priority 15 \
         cloud6-openstack-juno-el6-build cloud6-openstack-common-candidate
