output "ALB-sg" {
  value = aws_security_group.ACS["ext-alb-sg"].id
}


output "IALB-sg" {
  value = aws_security_group.ACS["int-alb-sg"].id
}


output "bastion-sg" {
  value = aws_security_group.ACS["bastion-sg"].id
}


output "nginx-sg" {
  value = aws_security_group.ACS["nginx-sg"].id
}


output "web-sg" {
  value = aws_security_group.ACS["webserver-sg"].id
}


output "datalayer-sg" {
  value = aws_security_group.ACS["datalayer-sg"].id
}
