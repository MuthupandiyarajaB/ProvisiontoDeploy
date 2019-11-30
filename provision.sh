sudo apt-get install unzip
https://www.terraform.io/downloads.html
sudo apt-get install sshpass
wget https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip
unzip terraform_0.12.7_linux_amd64.zip
sudo install terraform /usr/local/bin/
terraform --version

export ARM_CLIENT_ID=$1
export ARM_CLIENT_SECRET=$2
export ARM_SUBSCRIPTION_ID=$3
export ARM_TENANT_ID=$4
terraform init /home/vsts/work/r1/a/_Env-Soft-provision-CI/drop/main.tf
# terraform plan -out plan.out
# terraform apply -auto-approve plan.out

# export vmss_ip=$(terraform output instance_ip_addr)
# echo "host1 ansible_ssh_port=22 ansible_ssh_host=$vmss_ip" > inventory
# echo "[all:vars]" >> inventory
# echo "ansible_connection=ssh" >> inventory
# echo "ansible_user=testadmin" >> inventory
# echo "ansible_ssh_pass=Password1234!" >> inventory

# cat inventory
# export ANSIBLE_HOST_KEY_CHECKING=False


# sudo sshpass -p "Password1234!" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -r ../../_aconite-in.Sonic/drop/Sonic testadmin@$vmss_ip:~/