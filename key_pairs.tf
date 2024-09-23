
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}


resource "aws_key_pair" "this" {
  count = var.create_ec2_ssh_keypair ? 1 : 0

  key_name   = var.master_sgp_key
  public_key = tls_private_key.ssh.public_key_openssh

  tags = merge(
    { Name = "${var.friendly_name_prefix}-keypair" },
    { Name = var.master_sgp_key },
    var.common_tags
  )
}

resource "local_file" "private_key" {
  content  = tls_private_key.ssh.private_key_openssh
  filename = "${path.root}/generated/${var.master_sgp_key}.pem"

  provisioner "local-exec" {
    command = "chmod 400 ${path.root}/generated/${var.master_sgp_key}.pem"
  }
}
