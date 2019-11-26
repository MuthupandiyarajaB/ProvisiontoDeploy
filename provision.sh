sudo apt-get install unzip
sudo apt-get install sshpass
wget https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip
unzip terraform_0.11.14_linux_amd64.zip

export ARM_CLIENT_ID="f284d432-86d7-4e91-8bfb-af4845a56f73"
export ARM_CLIENT_SECRET="f284d432-86d7-4e91-8bfb-af4845a56f73"
export ARM_SUBSCRIPTION_ID="139c48a9-aa7e-4313-9aff-6966aa3269c9"
export ARM_TENANT_ID="4155e1ac-1a6a-47e0-ae4f-4895e145f22c"
terraform init
terraform plan -out plan.out
terraform apply -auto-approve

export vmss_ip=$(terraform output instance_ip_addr)
echo "host1 ansible_ssh_port=22 ansible_ssh_host=$vmss_ip" > inventory
echo "[all:vars]" >> inventory
echo "ansible_connection=ssh" >> inventory
echo "ansible_user=testadmin" >> inventory
echo "ansible_ssh_pass=Password1234!" >> inventory

cat inventory
export ANSIBLE_HOST_KEY_CHECKING=False