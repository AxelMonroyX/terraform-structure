environment ?= develop
ansible-setup-tf-env:
	ansible-playbook -i /opt/workspace/ansible_files/hosts /opt/workspace/ansible_files/setup_tasks.yml  --extra-vars "env=${environment}"
