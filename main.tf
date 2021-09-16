provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "jenkins" {
    ami                         = var.ami
    instance_type               = var.instancetype
    vpc_security_group_ids      = ["sg-0171b9eb291b9d915"]
    subnet_id                   = var.subnet
    associate_public_ip_address = true
    user_data                   = file("user-data.sh")
    tags                        = merge(map("Name", var.name), var.default_tags)
    key_name                    = var.keypair
}

resource "aws_ebs_volume" "data_volume" {
    availability_zone = aws_instance.jenkins.availability_zone
    size              = var.addlDiskSizeinGB
    tags              = var.default_tags
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.data_volume.id
  instance_id = aws_instance.jenkins.id
}

output "ip" {
  value = aws_instance.jenkins.private_ip
}
