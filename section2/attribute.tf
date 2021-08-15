resource "aws_eip" "lb" {
    vpc = true
}

resource "aws_s3_bucket" "mys3" {
    bucket = "anil-attribute-demo-001"
}


resource "aws_instance" "myinstance" {
    ami = "ami-0c2b8ca1dad447f8a"
    instance_type = "t2.micro"
}

resource "aws_eip_association" "eip_assoc" {
    instance_id = aws_instance.myinstance.id
    allocation_id = aws_eip.lb.id
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.sg.id
  network_interface_id = aws_instance.myinstance.primary_network_interface_id
}

resource "aws_security_group" "sg" {
  name        = "shiv_sg"
  ingress = [
    {
      description       = "TLS from VPC"
      from_port         = 443
      to_port           = 443
      protocol          = "tcp"
      cidr_blocks       = ["${aws_eip.lb.public_ip}/32"]
      ipv6_cidr_blocks  = []
      self              = true
      prefix_list_ids  = []
      security_groups   = []
      
    }
  ]
}

output "eip" {
    value = aws_eip.lb.public_ip
}

output "mys3bucket" {
    value = aws_s3_bucket.mys3.bucket_domain_name
}
