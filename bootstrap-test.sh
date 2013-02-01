#!/bin/bash

sudo gem install soloist

mkdir -p ~/cookbooks; cd ~/cookbooks

cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- flype_workstation::test
EOF

if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/roderik/pivotal_workstation.git
fi
if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi
if [[ -d flype_workstation ]]; then
  cd flype_workstation && git pull && cd ..
else
  git clone https://github.com/flype/flype_workstation.git
fi
soloist
