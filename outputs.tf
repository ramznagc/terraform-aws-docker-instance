output instance_public_ip {
  description = "The public IP address of the instance"
  value       = aws_instance.tf_my_ec2.*.public_ip
}

output security_group_id {
  description = "The ID of the security group"
  value       = aws_security_group.tf_sec_group.id
}

output instance_id {
  description = "The ID of the instance"
  value       = aws_instance.tf_my_ec2.*.id
}