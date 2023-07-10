output "ip_addresss" {
    value = "${aws_instance.main[*].public_ip}"
}