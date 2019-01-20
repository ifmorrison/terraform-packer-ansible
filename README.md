## Getting Started

Step 1: Setup a network using Terraform

Step 2: Create AMI using packer and ansible inside the above-created network

Step 3: Setup EC2 instance inside the network with packer AMI


### Command to run network Terraform

Go in folder networkTerraform, run command: 

1. terraform init

2. terraform plan

3. terraform apply

### Command to run Packer

Provide subnet id created in network terraform in packer.json

packer build packer.json

### Command to run main Terraform

Go in folder terraform, run command: 

1. terraform init

2. terraform plan

3. terraform apply
