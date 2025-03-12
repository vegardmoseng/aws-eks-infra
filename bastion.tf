resource "aws_instance" "aws_instance_ec2" {
  ami                          = var.aws_instance_ami
  instance_type                = var.instance_type
  associate_public_ip_address  = true
  subnet_id                    = module.vpc.public_subnets[0]
  key_name                     = aws_key_pair.key_pair_jumpserver.key_name
  
  vpc_security_group_ids = [
      aws_security_group.ec2-jumpserver-sg.id
  ]

  tags = {
    Name = var.instance_name
  }

}

resource "aws_key_pair" "key_pair_jumpserver" {
  key_name   = var.key_pair_name
  public_key = var.key_pair_public_key
}
