data aws_ami amazon-linux-2023 {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "name"
    values = ["al2023-ami-20*-kernel-6.18*"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}


resource aws_security_group tf_sec_group {
  name        = "${var.tag}-terraform-sec-group"
  description = "Security group for my EC2 instance"
  tags = {
    Name = "${var.tag}"
  }


  dynamic "ingress" {
    for_each = var.docker_instance_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }


resource aws_instance tf_my_ec2 {
  ami           = data.aws_ami.amazon-linux-2023.id
  instance_type = var.instance_type
  key_name     = var.key_name
  count        = var.num_of_instances
  vpc_security_group_ids = [aws_security_group.tf_sec_group.id]
  user_data = templatefile("${abspath(path.module)}/userdata.sh", { myserver = var.server_name })
  tags = {
    Name = "${var.tag}"
  }
}