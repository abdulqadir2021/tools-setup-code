infra:
	terraform init
	terraform apply -auto-approve

ansible:
	ansible-playbook -i $(tool_name)-internal.abdulqadir.shop, -e ansible_user=ec2-user -e ansible_password=Abdul1007# -e tool_name=$(tool_name) -e vault_token=$(vault_token) main.yml