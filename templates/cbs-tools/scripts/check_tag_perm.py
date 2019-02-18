#!/usr/bin/env python

# Copyright (c) 2015, Thomas Oulevey <thomas.oulevey@cern.ch>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY, WHETHER
# IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# This script checks if all tags have been assigned permissions and if not enforces them.

import koji
import os.path
import sys
from collections import defaultdict

KOJI_URL = 'http://localhost/kojihub'
CLIENT_CERT = os.path.expanduser('/etc/pki/koji/koji-admin.pem')
CLIENTCA_CERT = os.path.expanduser('/etc/pki/koji/koji_ca_cert.crt')
SERVERCA_CERT = os.path.expanduser('/etc/pki/ca-trust/extracted/openssl/ca-bundle.trust.crt')
USER = 'koji'
SYSTEM_TAGS = ['buildsys', 'bananas', 'infrastructure', 'oranges']

def get_all_tags():
    tags = [(x['name'], x['id'], x['perm']) for x in kojiclient.listTags()]
    return [ t for t in tags if t[0].split('-')[0][:-1] not in SYSTEM_TAGS ]


def fix_tag_permission(tags):
    for tag in tags:
        if not tag[0].endswith('-build') and tag[2] == None:
            perm_sig = 'build-' + tag[0].split('-')[0][:-1]
            print 'Updating %s with permission %s...'% (tag[0],perm_sig)
            kojiclient.editTag2(tag[0],perm=perm_sig)

if __name__ == '__main__':
    try:
        kojiclient = koji.ClientSession(KOJI_URL)
        kojiclient.ssl_login(CLIENT_CERT, CLIENTCA_CERT, SERVERCA_CERT)
    except:
        print "Could not connect to koji API"
        sys.exit(2)
    
    fix_tag_permission(get_all_tags())
    sys.exit(0)
