#internet vpc
resource "aws_vpc" "raytech_prod-vpc" {
	cidr_block = "10.0.0.0/16"
	instance_tenancy = "default"
	enable_dns_support = "true"
	enable_dns_hostnames = "true"
	enable_classiclink = "false"
	tags =  {
  		  Name = "raytech_prod-vpc"
	}
}

#subnets
resource "aws_subnet" "ap-south-1a-pub-sub" {
	vpc_id = "${aws_vpc.raytech_prod-vpc.id}"
	cidr_block = "10.0.1.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "ap-south-1a"
	tags = {
		Name = "pub-sub_ap-south-1a"
 	}
}

resource "aws_subnet" "ap-south-1b-pub-sub" {
        vpc_id = "${aws_vpc.raytech_prod-vpc.id}"
        cidr_block = "10.0.2.0/24"
        map_public_ip_on_launch = "true"
        availability_zone = "ap-south-1b"
        tags = {
                Name = "pub-sub_ap-south-1b"
	}
}

resource "aws_subnet" "ap-south-1c-pub-sub" {
        vpc_id = "${aws_vpc.raytech_prod-vpc.id}"
        cidr_block = "10.0.3.0/24"
        map_public_ip_on_launch = "true"
        availability_zone = "ap-south-1c"
        tags = {
                Name = "pub-sub_ap-south-1c"
	}
}

##private

resource "aws_subnet" "ap-south-1a-priv-sub" {
        vpc_id = "${aws_vpc.raytech_prod-vpc.id}"
        cidr_block = "10.0.4.0/24"
        map_public_ip_on_launch = "true"
        availability_zone = "ap-south-1a"
        tags = {
                Name = "priv-sub_ap-south-1a"
	}
}

resource "aws_subnet" "ap-south-1b-priv-sub" {
        vpc_id = "${aws_vpc.raytech_prod-vpc.id}"
        cidr_block = "10.0.5.0/24"
        map_public_ip_on_launch = "true"
        availability_zone = "ap-south-1b"
        tags = {
                Name = "priv-sub_ap-south-1b"
	}
}

resource "aws_subnet" "ap-south-1c-priv-sub" {
        vpc_id = "${aws_vpc.raytech_prod-vpc.id}"
        cidr_block = "10.0.6.0/24"
        map_public_ip_on_launch = "true"
        availability_zone = "ap-south-1c"
        tags = {
                Name = "priv-sub_ap-south-1c"
	}
}


## internet GW
resource "aws_internet_gateway" "raytech_IGW" {
	vpc_id = "${aws_vpc.raytech_prod-vpc.id}"
	tags = {
		Name = "raytech_IGW"
	}
}


##route tables
resource "aws_route_table" "raytech_pubRT" {
	vpc_id = "${aws_vpc.raytech_prod-vpc.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.raytech_IGW.id}"
  }
	tags = {
		Name = "raytech_pubRT"
	}
}

##route association of public subnet
resource "aws_route_table_association" "ap-south-1a-pub-subRT" {
	subnet_id = "${aws_subnet.ap-south-1a-pub-sub.id}"
	route_table_id = "${aws_route_table.raytech_pubRT.id}"
}

resource "aws_route_table_association" "ap-south-1b-pub-subRT" {
        subnet_id = "${aws_subnet.ap-south-1b-pub-sub.id}"
        route_table_id = "${aws_route_table.raytech_pubRT.id}"
}

resource "aws_route_table_association" "ap-south-1c-pub-subRT" {
        subnet_id = "${aws_subnet.ap-south-1c-pub-sub.id}"
        route_table_id = "${aws_route_table.raytech_pubRT.id}"
}

