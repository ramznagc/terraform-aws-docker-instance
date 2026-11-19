# Terraform AWS Docker Instance Module

A demonstration Terraform module that provisions an Amazon EC2 instance using an Amazon Linux 2023 AMI and installs Docker during instance initialization.

This repository is a learning example for reusable Terraform module structure and publication. It is **not intended as a production-ready module**.

## What it demonstrates

- AWS provider configuration
- EC2 instance provisioning
- AMI selection for Amazon Linux 2023
- Instance initialization for Docker installation
- Reusable module consumption

## Example usage

The following example shows the intended module interface. Confirm the module's published source and required inputs before using it in another project.

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "docker_instance" {
  source   = "ramznagc/docker-instance/aws"
  key_name = "mykey"
}
```

## Prerequisites

- Terraform installed
- An AWS account and configured credentials
- An EC2 key pair in the selected region if the module requires `key_name`

Prefer an IAM role or a secure AWS CLI profile over hard-coded access keys.

## Typical workflow

```bash
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

Review the plan before applying. AWS resources can incur charges.

When finished, remove resources created by this demonstration:

```bash
terraform destroy
```

## Production considerations

Before adapting this example for production, review network exposure, security groups, IAM permissions, SSH access, instance sizing, encrypted storage, logging, patching, and secret handling.

## Author

Ramazan Agac · [GitHub](https://github.com/ramznagc)
