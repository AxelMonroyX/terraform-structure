environment ?= develop
build:
	docker build -t ubuntu-ansible-terraform:1.0.4 -f docker_files/ubuntu-ansible-terraform.Dockerfile .
	docker tag ubuntu-ansible-terraform:1.0.4 ubuntu-ansible-terraform:latest
setup:
	docker run -it --rm -v $(PWD)/:/opt/workspace ubuntu-ansible-terraform:latest /bin/bash -c "make -f ansible_files/Makefile ansible-setup-tf-env environment=${environment}"
container:
	docker run -it --rm -v $(PWD)/:/opt/workspace ubuntu-ansible-terraform:latest /bin/bash
generate-docs:
	docker run --rm -v $(PWD)/:/opt/workspace ubuntu-ansible-terraform:latest /bin/bash -c "./generate-docs-and-format.sh"
version:
	docker run -it --rm -v $(PWD)/:/opt/workspace ubuntu-ansible-terraform:latest /bin/bash -c "terraform -v && terraform-docs -v && ansible --version"
init:
	docker run -it --rm -v $(PWD)/:/opt/workspace ubuntu-ansible-terraform:latest /bin/bash -c "cd ./environments/${environment}/ && terraform init $(filter-out $@,$(MAKECMDGOALS))" 
plan:
	docker run -it --rm -v $(PWD)/:/opt/workspace ubuntu-ansible-terraform:latest /bin/bash -c "cd ./environments/${environment}/ && terraform plan $(filter-out $@,$(MAKECMDGOALS))" 
apply:
	docker run -it --rm -v $(PWD)/:/opt/workspace ubuntu-ansible-terraform:latest /bin/bash -c "cd ./environments/${environment}/ && terraform apply $(filter-out $@,$(MAKECMDGOALS))" 
destroy:
	docker run -it --rm -v $(PWD)/:/opt/workspace ubuntu-ansible-terraform:latest /bin/bash -c "cd ./environments/${environment}/ && terraform destroy $(filter-out $@,$(MAKECMDGOALS))" 
echo: 
	echo $(filter-out $@,$(MAKECMDGOALS))
%:
	@:



