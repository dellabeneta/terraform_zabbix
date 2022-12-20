resource "aws_instance" "client" {
  count = 3
  ami                         = "ami-0574da719dca65348"
  instance_type               = "t2.micro"
  key_name                    = "zabbix"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.security_group_ec2.id]

  connection {
    type     = "ssh"
    user     = "ubuntu"
    password = file("~/.ssh/id_rsa.pub")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y zabbix-agent"
    ]
  }
  
  tags = {
    name = "client${count.index}"
  }

  depends_on = [
    aws_instance.server
  ]
}
