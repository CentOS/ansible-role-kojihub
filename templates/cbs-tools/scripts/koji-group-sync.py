#!/usr/bin/python
import ConfigParser
import sys

from centos import AccountSystem
from centos.client import AuthError


def group_users(account_system_handle):
    fas = account_system_handle
    groups = fas.group_data().keys()

    group_users = {}
    for groupname in groups:
        if not groupname.startswith(GROUP_INCLUDE_PREFIX):
            continue
        group_users[groupname] = [member_entry['username'] for member_entry in
                                  fas.group_members(groupname)]
    return group_users


def write_file(group_membership, filename):
    with open(filename, 'w') as groupfile:
        for groupname, users in group_membership.iteritems():
            signame = groupname[len(GROUP_INCLUDE_PREFIX):]
            print >>groupfile, "{0}:{1}".format(signame, ','.join(users))


if __name__ == '__main__':
    config = ConfigParser.SafeConfigParser()
    config.read('/etc/bsadmin/bsadmin.conf')

    try:
        FAS_TOPURL = config.get('fas', 'topurl')
        FAS_USERNAME = config.get('fas', 'username')
        FAS_PASSWORD = config.get('fas', 'password')
        IGNORE_CERT_VALIDATION = config.getboolean('fas', 'ignore_selfsigned')
        GROUP_INCLUDE_PREFIX = config.get('fas', 'group_prefix')
        GROUP_FILE = config.get('fas', 'group_file')
    except ConfigParser.NoOptionError as e:
        print >> sys.stderr, e.msg
        sys.exit(1)

    try:
        fas = AccountSystem(base_url=FAS_TOPURL,
                            username=FAS_USERNAME,
                            password=FAS_PASSWORD,
                            insecure=IGNORE_CERT_VALIDATION)
    except AuthError as e:
        print >> sys.stderr, e.msg
        sys.exit(1)

    write_file(group_users(fas), GROUP_FILE)
