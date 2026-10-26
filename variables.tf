variable instance_type {
  description = "The type of instance to create"
  type        = string
  default     = "t3.micro"
}

variable key_name {
  description = "The name of the key pair to use for the instance"
  type        = string
  #default     = "my-key-pair"
}

variable tag {
  description = "tag to assign to the resources"
  type        = string
  default     = "Docker-instance"
}


variable docker_instance_ports {
  description = "The port to expose for the Docker instance"
  type        = list(number)
  default     = [22, 80, 8080]
}

variable server_name {
  description = "The name of the server"
  type        = string
  default     = "docker-instance"
}

variable num_of_instances {
  description = "The number of instances to create"
  type        = number
  default     = 1
}