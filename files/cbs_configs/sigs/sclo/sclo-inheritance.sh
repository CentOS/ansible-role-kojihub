#!/bin/bash

koji add-tag-inheritance sclo7-devtoolset-3-rh-el7-build sclo7-rh-java-common-rh-candidate
koji add-tag-inheritance sclo7-devtoolset-3-rh-el7-build sclo7-maven30-rh-candidate --priority 15
koji add-tag-inheritance sclo6-devtoolset-3-rh-el6-build sclo6-rh-java-common-rh-candidate
koji add-tag-inheritance sclo6-devtoolset-3-rh-el6-build sclo6-maven30-rh-candidate --priority 15

koji add-tag-inheritance sclo7-maven30-rh-el7-build sclo7-rh-java-common-rh-candidate
koji add-tag-inheritance sclo6-maven30-rh-el6-build sclo6-rh-java-common-rh-candidate

koji add-tag-inheritance sclo7-mongodb24-rh-el7-build sclo7-v8314-rh-candidate
koji add-tag-inheritance sclo7-mongodb24-rh-el7-build sclo7-rh-java-common-rh-candidate --priority 15
koji add-tag-inheritance sclo7-mongodb24-rh-el7-build sclo7-maven30-rh-candidate --priority 16
koji add-tag-inheritance sclo6-mongodb24-rh-el6-build sclo6-v8314-rh-candidate
koji add-tag-inheritance sclo6-mongodb24-rh-el6-build sclo6-rh-java-common-rh-candidate --priority 15
koji add-tag-inheritance sclo6-mongodb24-rh-el6-build sclo6-maven30-rh-candidate --priority 16

koji add-tag-inheritance sclo7-nodejs010-rh-el7-build sclo7-v8314-rh-candidate  --priority 15

koji add-tag-inheritance sclo6-nodejs010-rh-el6-build sclo6-v8314-rh-candidate  --priority 15

koji add-tag-inheritance sclo6-php54-rh-el6-build sclo6-httpd24-rh-candidate
koji add-tag-inheritance sclo7-php54-rh-el7-build sclo7-httpd24-rh-candidate

koji add-tag-inheritance sclo6-php55-rh-el6-build sclo6-httpd24-rh-candidate
koji add-tag-inheritance sclo7-php55-rh-el7-build sclo7-httpd24-rh-candidate

koji add-tag-inheritance  sclo7-rh-java-common-rh-el7-build sclo7-maven30-rh-candidate
koji add-tag-inheritance  sclo6-rh-java-common-rh-el6-build sclo6-maven30-rh-candidate

koji add-tag-inheritance sclo7-rh-mongodb26-rh-el7-build sclo7-v8314-rh-candidate
koji add-tag-inheritance sclo7-rh-mongodb26-rh-el7-build sclo7-rh-java-common-rh-candidate --priority 15
koji add-tag-inheritance sclo7-rh-mongodb26-rh-el7-build sclo7-maven30-rh-candidate --priority 16
koji add-tag-inheritance sclo6-rh-mongodb26-rh-el6-build sclo6-v8314-rh-candidate
koji add-tag-inheritance sclo6-rh-mongodb26-rh-el6-build sclo6-rh-java-common-rh-candidate --priority 15
koji add-tag-inheritance sclo6-rh-mongodb26-rh-el6-build sclo6-maven30-rh-candidate --priority 16

koji add-tag-inheritance sclo6-rh-passenger40-rh-el6-build sclo6-ruby193-rh-candidate 
koji add-tag-inheritance sclo7-rh-passenger40-rh-el7-build sclo7-ruby193-rh-candidate
koji add-tag-inheritance sclo6-rh-passenger40-rh-el6-build sclo6-ror40-rh-candidate  --priority 15
koji add-tag-inheritance sclo7-rh-passenger40-rh-el7-build sclo7-ror40-rh-candidate --priority 15
koji add-tag-inheritance sclo6-rh-passenger40-rh-el6-build sclo6-rh-ror41-rh-candidate  --priority 16
koji add-tag-inheritance sclo7-rh-passenger40-rh-el7-build sclo7-rh-ror41-rh-candidate --priority 16
koji add-tag-inheritance sclo6-rh-passenger40-rh-el6-build sclo6-ruby200-rh-candidate  --priority 17
koji add-tag-inheritance sclo7-rh-passenger40-rh-el7-build sclo7-ruby200-rh-candidate --priority 17
koji add-tag-inheritance sclo6-rh-passenger40-rh-el6-build sclo6-rh-ruby22-rh-candidate  --priority 18
koji add-tag-inheritance sclo7-rh-passenger40-rh-el7-build sclo7-rh-ruby22-rh-candidate --priority 18

koji add-tag-inheritance sclo6-rh-php56-rh-el6-build sclo6-httpd24-rh-candidate
koji add-tag-inheritance sclo7-rh-php56-rh-el7-build sclo7-httpd24-rh-candidate

koji add-tag-inheritance sclo7-rh-ror41-rh-el7-build sclo7-rh-ruby22-rh-candidate
koji add-tag-inheritance sclo6-rh-ror41-rh-el6-build sclo6-rh-ruby22-rh-candidate
koji add-tag-inheritance sclo7-rh-ror41-rh-el7-build sclo7-v8314-rh-candidate --priority 15
koji add-tag-inheritance sclo6-rh-ror41-rh-el6-build sclo6-v8314-rh-candidate --priority 15

koji add-tag-inheritance sclo6-ror40-rh-el6-build sclo6-ruby200-rh-candidate
koji add-tag-inheritance sclo7-ror40-rh-el7-build sclo7-ruby200-rh-candidate
koji add-tag-inheritance sclo6-ror40-rh-el6-build sclo6-v8314-rh-candidate --priority 15 
koji add-tag-inheritance sclo7-ror40-rh-el7-build sclo7-v8314-rh-candidate --priority 15

koji add-tag-inheritance sclo6-thermostat1-rh-el6-build sclo6-rh-java-common-rh-candidate --priority 15
koji add-tag-inheritance sclo7-thermostat1-rh-el7-build sclo7-rh-java-common-rh-candidate --priority 15
koji add-tag-inheritance sclo6-thermostat1-rh-el6-build sclo6-maven30-rh-candidate --priority 16
koji add-tag-inheritance sclo7-thermostat1-rh-el7-build sclo7-maven30-rh-candidate --priority 16
koji add-tag-inheritance sclo6-thermostat1-rh-el6-build sclo6-rh-mongodb26-rh-candidate --priority 17
koji add-tag-inheritance sclo7-thermostat1-rh-el7-build sclo7-rh-mongodb26-rh-candidate --priority 17
koji add-tag-inheritance sclo6-thermostat1-rh-el6-build sclo6-v8314-rh-candidate --priority 18
koji add-tag-inheritance sclo7-thermostat1-rh-el7-build sclo7-v8314-rh-candidate --priority 18

koji add-tag-inheritance sclo7-sclo-vagrant1-sclo-el7-build sclo7-rh-ror41-rh-candidate  --priority 15
koji add-tag-inheritance sclo7-sclo-vagrant1-sclo-el7-build sclo7-rh-ruby22-rh-candidate --priority 16

koji add-tag-inheritance sclo6-sclo-php54-sclo-el6-build sclo6-php54-rh-candidate --priority=15

koji add-tag-inheritance sclo7-sclo-php54-sclo-el7-build sclo7-php54-rh-candidate --priority=15

koji add-tag-inheritance sclo6-sclo-php55-sclo-el6-build sclo6-php55-rh-candidate --priority=15

koji add-tag-inheritance sclo7-sclo-php55-sclo-el7-build sclo7-php55-rh-candidate --priority=15

koji add-tag-inheritance sclo6-sclo-php56-sclo-el6-build sclo6-rh-php56-rh-candidate --priority=15

koji add-tag-inheritance sclo7-sclo-php56-sclo-el7-build sclo7-rh-php56-rh-candidate --priority=15

koji add-tag-inheritance sclo7-rh-mongodb30upg-rh-el7-build sclo7-v8314-rh-candidate --priority=15
koji add-tag-inheritance sclo7-rh-mongodb30upg-rh-el7-build sclo7-rh-maven33-rh-candidate --priority=16
koji add-tag-inheritance sclo7-rh-mongodb30upg-rh-el7-build sclo7-maven30-rh-candidate --priority=17
koji add-tag-inheritance sclo7-rh-mongodb30upg-rh-el7-build sclo7-python27-rh-candidate --priority=18
koji add-tag-inheritance sclo7-rh-mongodb30upg-rh-el7-build sclo7-rh-java-common-rh-candidate --priority=19

koji add-tag-inheritance sclo7-rh-mongodb32-rh-el7-build sclo7-maven30-rh-candidate --priority=16
koji add-tag-inheritance sclo7-rh-mongodb32-rh-el7-build sclo7-python27-rh-candidate --priority=17
koji add-tag-inheritance sclo7-rh-mongodb32-rh-el7-build sclo7-rh-java-common-rh-candidate --priority=18

koji add-tag-inheritance sclo6-sclo-ror42-sclo-el6-build sclo6-rh-ruby22-rh-candidate --priority=15
koji add-tag-inheritance sclo6-sclo-ror42-sclo-el6-build sclo6-v8314-rh-candidate --priority=16

koji add-tag-inheritance sclo7-sclo-ror42-sclo-el7-build sclo7-rh-ruby22-rh-candidate --priority=15
koji add-tag-inheritance sclo7-sclo-ror42-sclo-el7-build sclo7-v8314-rh-candidate --priority=16

koji add-tag-inheritance sclo7-rh-maven33-rh-el7-build sclo7-rh-java-common-rh-candidate --priority 15

koji add-tag-inheritance sclo7-rh-ror42-rh-el7-build sclo7-rh-ruby23-rh-candidate --priority 15
koji add-tag-inheritance sclo7-rh-ror42-rh-el7-build sclo7-v8314-rh-candidate --priority 16
koji add-tag-inheritance sclo7-rh-ror42-rh-el7-build sclo7-nodejs010-rh-candidate --priority 17
koji add-tag-inheritance sclo7-rh-ror42-rh-el7-build sclo7-rh-nodejs4-rh-candidate --priority 18
koji add-tag-inheritance sclo7-rh-ror42-rh-el7-build sclo7-rh-mongodb32-rh-candidate --priority 19
koji add-tag-inheritance sclo7-rh-ror42-rh-el7-build sclo7-rh-java-common-rh-candidate --priority 20

koji add-tag-inheritance sclo7-sclo-httpd24more-sclo-el7-build sclo7-httpd24-rh-release --priority 15

koji add-tag-inheritance sclo6-sclo-httpd24more-sclo-el6-build sclo6-httpd24-rh-release --priority 15

koji add-tag-inheritance sclo7-rh-nodejs4-rh-el7-build sclo7-nodejs010-rh-candidate  --priority 15

koji add-tag-inheritance sclo7-rh-nodejs4-rh-el7-build sclo7-nodejs010-rh-candidate  --priority 15

koji add-tag-inheritance sclo7-rh-python35-rh-el7-build sclo7-httpd24-rh-candidate --priority 15


koji add-tag-inheritance sclo6-sclo-git25-sclo-el6-build sclo6-httpd24-rh-release --priority 15

koji add-tag-inheritance sclo7-sclo-git25-sclo-el7-build sclo7-httpd24-rh-release --priority 15

koji add-tag-inheritance sclo6-sclo-subversion19-sclo-el6-build sclo6-httpd24-rh-release --priority 15
koji add-tag-inheritance sclo6-sclo-subversion19-sclo-el6-build sclo6-ruby200-rh-release --priority 16
koji add-tag-inheritance sclo6-sclo-subversion19-sclo-el6-build sclo6-python27-rh-release --priority 17

koji add-tag-inheritance sclo7-sclo-subversion19-sclo-el7-build sclo7-httpd24-rh-release --priority 15

koji add-tag-inheritance sclo6-rh-nodejs4-rh-el6-build sclo6-devtoolset-4-rh-candidate --priority 15

koji add-tag-inheritance sclo6-rh-thermostat16-rh-el6-build sclo6-rh-java-common-rh-candidate --priority 15
koji add-tag-inheritance sclo7-rh-thermostat16-rh-el7-build sclo7-rh-java-common-rh-candidate --priority 15
koji add-tag-inheritance sclo6-rh-thermostat16-rh-el6-build sclo6-maven30-rh-candidate --priority 16
koji add-tag-inheritance sclo7-rh-thermostat16-rh-el7-build sclo7-maven30-rh-candidate --priority 16
koji add-tag-inheritance sclo6-rh-thermostat16-rh-el6-build sclo6-rh-mongodb32-rh-candidate --priority 17
koji add-tag-inheritance sclo7-rh-thermostat16-rh-el7-build sclo7-rh-mongodb32-rh-candidate --priority 17
koji add-tag-inheritance sclo6-rh-thermostat16-rh-el6-build sclo6-rh-maven33-rh-candidate --priority 18
koji add-tag-inheritance sclo7-rh-thermostat16-rh-el7-build sclo7-rh-maven33-rh-candidate --priority 18

koji add-tag-inheritance sclo6-rh-git29-rh-el6-build sclo6-httpd24-rh-candidate --priority 15
koji add-tag-inheritance sclo7-rh-git29-rh-el7-build sclo7-httpd24-rh-candidate --priority 16

koji add-tag-inheritance sclo6-rh-eclipse46-rh-el6-build sclo6-rh-maven33-rh-candidate --priority 15
koji add-tag-inheritance sclo6-rh-eclipse46-rh-el6-build sclo6-rh-java-common-rh-candidate --priority 16
koji add-tag-inheritance sclo6-rh-eclipse46-rh-el6-build sclo6-devtoolset-4-rh-candidate --priority 17
koji add-tag-inheritance sclo6-rh-eclipse46-rh-el6-build sclo6-devtoolset-6-rh-candidate --priority 18

koji add-tag-inheritance sclo7-rh-eclipse46-rh-el7-build sclo7-rh-maven33-rh-candidate --priority 15
koji add-tag-inheritance sclo7-rh-eclipse46-rh-el7-build sclo7-rh-java-common-rh-candidate --priority 16
koji add-tag-inheritance sclo7-rh-eclipse46-rh-el7-build sclo7-devtoolset-4-rh-candidate --priority 17
koji add-tag-inheritance sclo7-rh-eclipse46-rh-el7-build sclo7-devtoolset-6-rh-candidate --priority 18

koji add-tag-inheritance sclo6-rh-php70-rh-el6-build sclo6-httpd24-rh-candidate --priority 15
koji add-tag-inheritance sclo7-rh-php70-rh-el7-build sclo7-httpd24-rh-candidate --priority 16

koji add-tag-inheritance sclo6-rh-perl524-rh-el6-build sclo6-httpd24-rh-candidate --priority 15
koji add-tag-inheritance sclo7-rh-perl524-rh-el7-build sclo7-httpd24-rh-candidate --priority 16

koji add-tag-inheritance sclo6-rh-mongodb32-rh-el6-build sclo6-devtoolset-4-rh-candidate  --priority 15
koji add-tag-inheritance sclo6-rh-mongodb32-rh-el6-build sclo6-rh-maven33-rh-candidate  --priority 16
koji add-tag-inheritance sclo6-rh-mongodb32-rh-el6-build sclo6-maven30-rh-candidate  --priority 17
koji add-tag-inheritance sclo6-rh-mongodb32-rh-el6-build sclo6-python27-rh-candidate  --priority 18
koji add-tag-inheritance sclo6-rh-mongodb32-rh-el6-build sclo6-rh-java-common-rh-candidate  --priority 19
koji add-tag-inheritance sclo6-rh-mongodb32-rh-el6-build sclo6-v8314-rh-candidate  --priority 20

koji add-tag-inheritance sclo6-rh-mongodb30upg-rh-el6-build sclo6-devtoolset-4-rh-candidate  --priority 15
koji add-tag-inheritance sclo6-rh-mongodb30upg-rh-el6-build sclo6-rh-maven33-rh-candidate  --priority 16
koji add-tag-inheritance sclo6-rh-mongodb30upg-rh-el6-build sclo6-maven30-rh-candidate  --priority 17
koji add-tag-inheritance sclo6-rh-mongodb30upg-rh-el6-build sclo6-python27-rh-candidate  --priority 18
koji add-tag-inheritance sclo6-rh-mongodb30upg-rh-el6-build sclo6-rh-java-common-rh-candidate  --priority 19
koji add-tag-inheritance sclo6-rh-mongodb30upg-rh-el6-build sclo6-v8314-rh-candidate  --priority 20

koji add-tag-inheritance sclo6-rh-ror42-rh-el6-build sclo6-rh-ruby23-rh-candidate --priority 15
koji add-tag-inheritance sclo6-rh-ror42-rh-el6-build sclo6-rh-nodejs4-rh-candidate --priority 18
koji add-tag-inheritance sclo6-rh-ror42-rh-el6-build sclo6-rh-mongodb32-rh-candidate --priority 19
koji add-tag-inheritance sclo6-rh-ror42-rh-el6-build sclo6-rh-java-common-rh-candidate --priority 20

koji add-tag-inheritance sclo6-rh-python35-rh-el6-build sclo6-httpd24-rh-candidate --priority 15

koji add-tag-inheritance sclo6-rh-maven33-rh-el6-build sclo6-rh-java-common-rh-candidate --priority 15
koji add-tag-inheritance sclo6-rh-maven33-rh-el6-build sclo6-maven30-rh-candidate --priority 16


koji add-tag-inheritance sclo6-devtoolset-6-rh-el6-build sclo6-rh-maven33-rh-candidate  --priority 16
koji add-tag-inheritance sclo6-devtoolset-6-rh-el6-build sclo6-maven30-rh-candidate  --priority 17
koji add-tag-inheritance sclo6-devtoolset-6-rh-el6-build sclo6-rh-java-common-rh-candidate  --priority 18

koji add-tag-inheritance sclo7-devtoolset-6-rh-el7-build sclo7-rh-maven33-rh-candidate  --priority 16
koji add-tag-inheritance sclo7-devtoolset-6-rh-el7-build sclo7-maven30-rh-candidate  --priority 17
koji add-tag-inheritance sclo7-devtoolset-6-rh-el7-build sclo7-rh-java-common-rh-candidate  --priority 18

koji add-tag-inheritance sclo7-rh-scala210-rh-el7-build sclo7-rh-java-common-rh-candidate  --priority 16
koji add-tag-inheritance sclo7-rh-scala210-rh-el7-build sclo7-rh-maven33-rh-candidate  --priority 17

koji add-tag-inheritance sclo7-rh-ror50-rh-el7-build sclo7-rh-ruby24-rh-candidate --priority 16
koji add-tag-inheritance sclo7-rh-ror50-rh-el7-build sclo7-rh-mongodb32-rh-candidate --priority 17
koji add-tag-inheritance sclo7-rh-ror50-rh-el7-build sclo7-rh-nodejs6-rh-candidate --priority 18
koji add-tag-inheritance sclo7-rh-ror50-rh-el7-build sclo7-devtoolset-4-rh-candidate --priority 19

koji add-tag-inheritance sclo7-rh-nodejs6-rh-el7-build sclo7-devtoolset-4-rh-candidate --priority 16
koji add-tag-inheritance sclo7-rh-nodejs6-rh-el7-build sclo7-devtoolset-6-rh-candidate --priority 17


koji add-tag-inheritance sclo6-rh-scala210-rh-el6-build sclo6-rh-java-common-rh-candidate  --priority 16
koji add-tag-inheritance sclo6-rh-scala210-rh-el6-build sclo6-rh-maven33-rh-candidate  --priority 17

koji add-tag-inheritance sclo6-rh-ror50-rh-el6-build sclo6-rh-ruby24-rh-candidate --priority 16
koji add-tag-inheritance sclo6-rh-ror50-rh-el6-build sclo6-rh-mongodb32-rh-candidate --priority 17
koji add-tag-inheritance sclo6-rh-ror50-rh-el6-build sclo6-rh-nodejs6-rh-candidate --priority 18
koji add-tag-inheritance sclo6-rh-ror50-rh-el6-build sclo6-devtoolset-4-rh-candidate --priority 19

koji add-tag-inheritance sclo6-rh-nodejs6-rh-el6-build sclo6-devtoolset-4-rh-candidate --priority 16
koji add-tag-inheritance sclo6-rh-nodejs6-rh-el6-build sclo6-devtoolset-6-rh-candidate --priority 17

koji add-tag-inheritance sclo6-rh-scala210-rh-el6-build sclo6-maven30-rh-candidate --priority 18
koji add-tag-inheritance sclo7-rh-scala210-rh-el7-build sclo7-maven30-rh-candidate --priority 18

koji add-tag-inheritance sclo7-devtoolset-7-rh-el7-build sclo7-rh-maven33-rh-candidate --priority 16
koji add-tag-inheritance sclo7-devtoolset-7-rh-el7-build sclo7-rh-maven35-rh-candidate --priority 17
koji add-tag-inheritance sclo7-devtoolset-7-rh-el7-build sclo7-maven30-rh-candidate --priority 18
koji add-tag-inheritance sclo7-devtoolset-7-rh-el7-build sclo7-rh-java-common-rh-candidate --priority 19
koji add-tag-inheritance sclo7-devtoolset-7-rh-el7-build sclo7-llvm-toolset-7-rh-candidate --priority 21
koji add-tag-inheritance sclo7-devtoolset-7-rh-el7-build sclo7-go-toolset-7-rh-candidate --priority 22
koji add-tag-inheritance sclo7-devtoolset-7-rh-el7-build sclo7-rust-toolset-7-rh-candidate --priority 23

koji add-tag-inheritance sclo6-devtoolset-7-rh-el6-build sclo6-rh-maven33-rh-candidate --priority 16
koji add-tag-inheritance sclo6-devtoolset-7-rh-el6-build sclo6-maven30-rh-candidate --priority 18
koji add-tag-inheritance sclo6-devtoolset-7-rh-el6-build sclo6-rh-java-common-rh-candidate --priority 19

koji add-tag-inheritance sclo7-rh-mariadb102-rh-el7-build sclo7-devtoolset-7-rh-candidate

koji add-tag-inheritance sclo6-rh-mariadb102-rh-el6-build sclo6-devtoolset-7-rh-candidate

koji add-tag-inheritance sclo7-rh-mongodb34-rh-el7-build sclo7-devtoolset-6-rh-candidate  --priority 15
koji add-tag-inheritance sclo7-rh-mongodb34-rh-el7-build sclo7-devtoolset-7-rh-candidate  --priority 16
koji add-tag-inheritance sclo7-rh-mongodb34-rh-el7-build sclo7-rh-python36-rh-candidate  --priority 17
koji add-tag-inheritance sclo7-rh-mongodb34-rh-el7-build sclo7-python27-rh-candidate  --priority 18
koji add-tag-inheritance sclo7-rh-mongodb34-rh-el7-build sclo7-rh-maven33-rh-candidate  --priority 19
koji add-tag-inheritance sclo7-rh-mongodb34-rh-el7-build sclo7-rh-java-common-rh-candidate  --priority 21
koji add-tag-inheritance sclo7-rh-mongodb34-rh-el7-build sclo7-rh-maven35-rh-candidate  --priority 22
koji add-tag-inheritance sclo7-rh-mongodb34-rh-el7-build sclo7-go-toolset-7-rh-candidate --priority 23

koji add-tag-inheritance sclo6-rh-mongodb34-rh-el6-build sclo6-devtoolset-6-rh-candidate  --priority 15
koji add-tag-inheritance sclo6-rh-mongodb34-rh-el6-build sclo6-devtoolset-7-rh-candidate  --priority 16
koji add-tag-inheritance sclo6-rh-mongodb34-rh-el6-build sclo6-rh-python36-rh-candidate  --priority 17
koji add-tag-inheritance sclo6-rh-mongodb34-rh-el6-build sclo6-python27-rh-candidate  --priority 18
koji add-tag-inheritance sclo6-rh-mongodb34-rh-el6-build sclo6-rh-maven33-rh-candidate  --priority 19
koji add-tag-inheritance sclo6-rh-mongodb34-rh-el6-build sclo6-rh-java-common-rh-candidate  --priority 21


koji add-tag-inheritance sclo7-rh-python36-rh-el7-build sclo7-httpd24-rh-candidate  --priority 15

koji add-tag-inheritance sclo6-rh-python36-rh-el6-build sclo6-httpd24-rh-candidate  --priority 15


koji add-tag-inheritance sclo7-rh-nginx112-rh-el7-build sclo7-rh-perl524-rh-candidate  --priority 15
koji add-tag-inheritance sclo7-rh-nginx112-rh-el7-build sclo7-httpd24-rh-candidate  --priority 16

koji add-tag-inheritance sclo7-rh-nodejs8-rh-el7-build sclo7-devtoolset-7-rh-candidate  --priority 15

koji add-tag-inheritance sclo7-rh-maven35-rh-el7-build sclo7-rh-java-common-rh-candidate  --priority 15
koji add-tag-inheritance sclo7-rh-maven35-rh-el7-build sclo7-rh-maven33-rh-candidate  --priority 16
koji add-tag-inheritance sclo7-rh-maven35-rh-el7-build sclo7-maven30-rh-candidate  --priority 17


koji add-tag-inheritance sclo7-llvm-toolset-7-rh-el7-build sclo7-devtoolset-7-rh-candidate  --priority 15

koji add-tag-inheritance sclo7-rust-toolset-7-rh-el7-build sclo7-devtoolset-7-rh-candidate  --priority 15
koji add-tag-inheritance sclo7-rust-toolset-7-rh-el7-build sclo7-llvm-toolset-7-rh-candidate  --priority 16

koji add-tag-inheritance sclo7-sclo-cassandra3-sclo-el7-build sclo7-rh-maven33-rh-candidate  --priority 16
koji add-tag-inheritance sclo7-sclo-cassandra3-sclo-el7-build sclo7-maven30-rh-candidate  --priority 17
koji add-tag-inheritance sclo7-sclo-cassandra3-sclo-el7-build sclo7-rh-java-common-rh-candidate  --priority 18

koji add-tag-inheritance sclo7-sclo-python27-sclo-el7-build sclo7-python27-rh-candidate  --priority 15

koji add-tag-inheritance sclo7-sclo-python34-sclo-el7-build sclo7-rh-python34-rh-candidate  --priority 15

koji add-tag-inheritance sclo7-sclo-python35-sclo-el7-build sclo7-rh-python35-rh-candidate  --priority 15

koji add-tag-inheritance sclo6-sclo-python27-sclo-el6-build sclo6-python27-rh-candidate  --priority 15

koji add-tag-inheritance sclo6-sclo-python34-sclo-el6-build sclo6-rh-python34-rh-candidate  --priority 15

koji add-tag-inheritance sclo6-sclo-python35-sclo-el6-build sclo6-rh-python35-rh-candidate  --priority 15

koji add-tag-inheritance sclo7-rh-php71-rh-el7-build sclo7-httpd24-rh-candidate --priority 15

koji add-tag-inheritance sclo7-sclo-php71-sclo-el7-build sclo7-rh-php71-rh-candidate --priority 15

koji add-tag-inheritance sclo6-rh-nginx110-rh-el6-build sclo6-rh-perl524-rh-candidate --priority=20
koji add-tag-inheritance sclo7-rh-nginx110-rh-el7-build sclo7-rh-perl524-rh-candidate --priority=21

koji add-tag-inheritance sclo6-rh-nginx110-rh-el6-build sclo6-httpd24-rh-candidate --priority 16
koji add-tag-inheritance sclo7-rh-nginx110-rh-el7-build sclo7-httpd24-rh-candidate --priority 16

koji add-tag-inheritance sclo6-rh-nodejs4-rh-el6-build sclo6-devtoolset-6-rh-candidate --priority 16
koji add-tag-inheritance sclo7-rh-nodejs4-rh-el7-build sclo7-devtoolset-6-rh-candidate --priority 16

koji add-tag-inheritance sclo7-rh-mongodb36-rh-el7-build sclo7-go-toolset-7-rh-candidate --priority 15


koji add-tag-inheritance sclo7-rh-mysql57-rh-el7-build sclo7-devtoolset-7-rh-candidate --priority 15
koji add-tag-inheritance sclo6-rh-mysql57-rh-el6-build sclo6-devtoolset-7-rh-candidate --priority 15

koji add-tag-inheritance sclo7-rh-git218-rh-el7-build sclo7-httpd24-rh-candidate --priority 15

koji add-tag-inheritance sclo7-rh-mysql80-rh-el7-build sclo7-devtoolset-7-rh-candidate --priority 15
koji add-tag-inheritance sclo7-rh-mysql80-rh-el7-build sclo7-devtoolset-8-rh-candidate --priority 16

koji add-tag-inheritance sclo7-rh-nodejs10-rh-el7-build sclo7-devtoolset-7-rh-candidate --priority 16
koji add-tag-inheritance sclo7-rh-nodejs10-rh-el7-build sclo7-devtoolset-8-rh-candidate --priority 17

koji add-tag-inheritance sclo7-rh-php72-rh-el7-build sclo7-httpd24-rh-candidate --priority 15

koji add-tag-inheritance sclo7-rh-nginx114-rh-el7-build sclo7-rh-perl526-rh-candidate --priority 15
koji add-tag-inheritance sclo7-rh-nginx114-rh-el7-build sclo7-httpd24-rh-candidate --priority 16

koji add-tag-inheritance sclo7-rh-ror42-rh-el7-build sclo7-rh-nodejs8-rh-candidate --priority 22
koji add-tag-inheritance sclo6-rh-ror42-rh-el6-build sclo6-rh-nodejs6-rh-candidate --priority 22
