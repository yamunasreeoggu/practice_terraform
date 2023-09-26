resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0a9fe6f055e22e092"]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z10281701O26X6KFZM8G8"
  name    = "frontend.yamunadevops.online"
  type    = "A"
  ttl     = 10
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0a9fe6f055e22e092"]

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z10281701O26X6KFZM8G8"
  name    = "mysql.yamunadevops.online"
  type    = "A"
  ttl     = 10
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "backend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-0a9fe6f055e22e092"]

  tags = {
    Name = "backend"
  }
}

resource "aws_route53_record" "backend" {
  zone_id = "Z10281701O26X6KFZM8G8"
  name    = "backend.yamunadevops.online"
  type    = "A"
  ttl     = 10
  records = [aws_instance.backend.private_ip]
}