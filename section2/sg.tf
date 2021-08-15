resource "aws_security_group" "sg" {
  name        = "shiv_sg"
  ingress  {
      description       = "TLS from VPC"
      from_port         = 443
      to_port           = 443
      protocol          = "tcp"
      cidr_blocks       = [var.vpn_ip]
      /*ipv6_cidr_blocks  = []
      self              = false
      prefix_list_ids  = []
      security_groups   = []*/
      
    }
    ingress  {
      description       = "TLS from VPC"
      from_port         = 80
      to_port           = 80
      protocol          = "tcp"
      cidr_blocks       = [var.vpn_ip]
    }
    ingress  {
      description       = "TLS from VPC"
      from_port         = 22
      to_port           = 22
      protocol          = "tcp"
      cidr_blocks       = [var.vpn_ip]
    }

    tags = local.common_tags

}

