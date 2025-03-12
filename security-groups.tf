resource "aws_security_group" "ec2-jumpserver-sg" {
  name        = var.ec2_jumpserver_sg_name
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress = [
    {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = var.ec2_jumpserver_sg_ip_wlist
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]
  egress = [
    {
      description      = "all"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]
}