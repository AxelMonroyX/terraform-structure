#!/bin/bash

sudo apt update
apt-get --yes install jq
sudo apt install nginx -y
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx HTTP'
sudo ufw enable

# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
curl -s http://169.254.169.254/latest/dynamic/instance-identity/document


metadata="$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document)"
instanceId="$(echo "$metadata" | jq .instanceId)"
architecture="$(echo "$metadata" | jq .architecture)"
availabilityZone="$(echo "$metadata" | jq .availabilityZone)"
instanceType="$(echo "$metadata" | jq .instanceType)"
privateIp="$(echo "$metadata" | jq .privateIp)"
region="$(echo "$metadata" | jq .region)"


cat >/var/www/html/index.nginx-debian.html << EOL
<!DOCTYPE html>
<html>

<head>
    <title>Metadata from $instanceId</title>
</head>

<body>
    <h1>Metadata from $instanceId</h1>
    <pre>
instanceId $instanceId
architecture $architecture
availabilityZone $availabilityZone
instanceType $instanceType
privateIp $privateIp
region $region
    </pre>
</body>

</html>
EOL