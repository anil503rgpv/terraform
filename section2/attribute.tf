resource "aws_eip" "lb" {
    vpc = true
    tags = local.common_tags
}

resource "aws_instance" "myinstance" {
    ami = "ami-0c2b8ca1dad447f8a"
    instance_type = var.instance_type   //its use when instance type is string
    #instance_type = var.instance_type_map["us-east-2"]   //its use when instance type is map
    #instance_type = var.instance_type_list[2]   //its use when instance type is List
    security_groups = [ aws_security_group.sg.name ]

    count = 1
    tags = local.common_tags

    #count = var.istest == true ? 1 : 0  //conditional statement
}

resource "aws_eip_association" "eip_assoc" {
    instance_id = aws_instance.myinstance[0].id
    allocation_id = aws_eip.lb.id
}

/*
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.sg.id
  network_interface_id = aws_instance.myinstance.primary_network_interface_id
}
*/
