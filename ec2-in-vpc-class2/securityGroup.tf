resource "aws_security_group" "allow-ssh" {
	vpc_id = "${aws_vpc.raytech_prod-vpc.id}"
	name = "allow-ssh"
	description = "security group that allow ssh and all egress traffic"
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
		
	}

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	
	}	

	tags = {
		Name = "allow-ssh"
	}
}