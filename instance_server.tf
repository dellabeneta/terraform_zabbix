resource "aws_instance" "server" {
  ami                         = "ami-08e637cea2f053dfa"
  instance_type               = "t2.small"
  key_name                    = "zabbix"
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.security_group_ec2.id]
  
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = file("~/.ssh/id_rsa.pub")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y wget",
      "sudo wget https://dellops-zabbix-monitoramento.s3.amazonaws.com/script.sh",
      "sudo chmod +x script.sh",
      "sudo ./script.sh"
    ]
  }
  
  tags = {
    name = "server"
  }

  depends_on = [
    aws_s3_bucket.s3_bucket
  ]
}