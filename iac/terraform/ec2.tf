resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  subnet_id = aws_subnet.rameez.id
  associate_public_ip_address = var.kutta_rameez
  security_groups = [ "${aws_security_group.allow_tls.id}" ]

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.rameez.id
egress  {
     from_port       = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
}
ingress  {
    from_port       = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

}
  tags = {
    Name = "allow_tls"
  }
}

