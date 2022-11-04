<h1 align="center">
  <br>
  Capstone Project - Infrastructure
  <br>
</h1>

The infrastructure consists of a Google Cloud VM for each micro-service.
* *Vue*
* *Happy*
* *Expressed*
* *Bootstorage*

The infrastructure is deployed by Terraform and managed by Ansible.

### Google Cloud Credentials Setup ###
At the Google Cloud Console:
1. Go to 'API & Services' > 'Enabled APIs and Services'
2. Search for 'compute engine api' and Enable it
3. Go to 'IAM and Admin' > 'Service Accounts' > 'Manage keys' > 'Create new key'
4. Select JSON and 'Create'
5. Save the downloaded file to the /kubernetes-starterkit/infrastructure folder.
6. At the mgmt machine, on the /kubernetes-starterkit directory run ```gcloud auth login``` and follow the instructions.

Finally, on the file 'terraform-gcp-provider.tf' change the credentials file to your own. And on the file 'terraform-gcp-variables.tf' change the GCP_PROJECT_ID to your own.

### Terraform Setup ###

In order to deploy the infrastructure, run the following commands:
* Initializing Terraform:
```
terraform init
terraform plan
```
* After success run the following to create the cloud VMs:
```
terraform apply
```

### Ansible Setup ###

At the end of ```terraform apply``` there will be the IP's of each machine. Copy these and substitute them in the 'gcphosts' file (this is Ansible's inventory file, this is needed for Ansible to access the machines and configure them).

Finally, run the Ansible playbook, to automaticcally setup each machine and start each service:
```
ansible-playbook ansible-gcp-servers-setup-all.yml
```

------