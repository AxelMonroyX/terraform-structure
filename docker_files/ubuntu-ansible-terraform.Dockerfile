FROM ubuntu:focal

RUN DEBIAN_FRONTEND=noninteractive apt update \
    && apt install -y tzdata \
    && apt install software-properties-common -y \
    && apt-add-repository --yes --update ppa:ansible/ansible \
    && apt install ansible wget unzip make curl python3-pip git -y \
    && pip3 install "ansible-lint[yamllint]"
RUN wget https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_amd64.zip \
    && unzip terraform_1.0.4_linux_amd64.zip -d /usr/bin \
    && curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.14.1/terraform-docs-v0.14.1-$(uname)-amd64.tar.gz \
    && mkdir -p /opt/terraform-docs \
    && tar -xzf terraform-docs.tar.gz -C /opt/terraform-docs \
    && mv /opt/terraform-docs/terraform-docs /usr/bin \
    && mkdir -p /opt/workspace
WORKDIR /opt/workspace