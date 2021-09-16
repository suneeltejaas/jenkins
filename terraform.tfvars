name = "jenkins"
region = "us-east-1"
instancetype = "t2.medium"
ami = "ami-09e67e426f25ce0d7"
vpc = "vpc-79857b04"
subnet = "subnet-0b42b09911e359286"
default_tags = {
        "Application":"Jenkins",
        "Environment":"CICD",
  }
keypair = "suneel-test"
sshSecurityGroup = "sg-0171b9eb291b9d915"
addlDiskSizeinGB = 20
