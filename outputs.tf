output "instance_server_type" {
  value = aws_instance.server.instance_type
}

output "instance_clients_type" {
  value = aws_instance.client.*.instance_type
}

output "instance_server_public_ip" {
  value = aws_instance.server.public_ip
}

output "instance_server_private_ip" {
  value = aws_instance.server.private_ip
}

output "instance_clients_public_ips" {
  value = aws_instance.client.*.public_ip
}

output "instance_clients_private_ips" {
  value = aws_instance.client.*.private_ip
}