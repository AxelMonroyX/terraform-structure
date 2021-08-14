#!/bin/bash
echo "Format Files...."
terraform fmt -recursive -list=true environments/
terraform fmt -recursive -list=true modules/
echo "Generate docs..."
for D in `find /opt/workspace/modules/* -maxdepth 0 -type d`; do terraform-docs $D; done
for D in `find /opt/workspace/environments/* -maxdepth 0 -type d`; do terraform-docs $D; done
echo "Format and Docs done"
for D in `ls /opt/workspace/ansible_files/*tasks.yml`; do ansible-lint -p $D; done
