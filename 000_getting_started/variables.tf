# Define a variable
# Then, we will need to send through the CLI the value of this variable.
# $ terraform apply -var=instance_type="t2.micro" 
variable "instance_type" {
    type = string
}

