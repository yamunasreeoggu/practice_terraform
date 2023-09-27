resource "aws_instance" "instance" {
  ami           = local.ami
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.sg_id]

  tags = {
    Name = var.component
  }
}

resource "aws_route53_record" "dnsrecord" {
  zone_id = local.zone_id
  name    = "${var.component}.${var.zone_id}"
  type    = "A"
  ttl     = 10
  records = [aws_instance.instance.private_ip]
}

resource "null_resource" "ansible" {
  depends_on = [aws_route53_record.dnsrecord]
  provisioner "local-exec" {
    command = <<EOF
cd /home/centos/infra-ansible
git pull
sleep 60
ansible-playbook -i ${aws_instance.instance.private_ip}, -e ansible_user=centos -e ansible_password=DevOps321 main.yml -e role_name=${var.component}
EOF
  }
}
