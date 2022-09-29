data "hcp_packer_iteration" "webserver" {
  bucket_name = var.bucket_name
  channel     = var.channel
}

data "hcp_packer_image" "webserver" {
  bucket_name    = var.bucket_name
  cloud_provider = var.cloud_provider
  iteration_id   = data.hcp_packer_iteration.webserver.ulid
  region         = var.region
}

resource "aws_instance" "webserver" {
  ami                         = data.hcp_packer_image.webserver.cloud_image_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.sg_web_server.id]
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  tags = {
    Name = "${var.user}-${var.business_unit}"
  }
}
