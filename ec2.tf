resource "aws_key_pair" "deployer" {
    key_name = "terra-key.pub"
    public_key = file ("/Users/pratibhapatil/Desktop/Learning/Docker-AWS-Demo/terra-key.pub")
}

resource "aws_default_vpc" "default" {

}

#security group > for ssh port 22 incomming outgoing traffic
resource "aws_security_group" "mysecurity" {
    name = "allow ports"
    description = "This is for ec2 deployer..."
    vpc_id = aws_default_vpc.default.id    


    ingress {
        from_port = 22
        to_port = 22
        description =" this is for ingoing traffic"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  #can access anywhere
    }

    egress {
        description =" this is for outgoing traffic"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]  #can access anywhere
    }
}


resource "aws_instance" "docker_demo_instance_0001" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = aws_key_pair.deployer.key_name
    security_groups= [aws_security_group.mysecurity.name]
    tags = {
        Name = "${var.my_env}-docker-automate-001"
    }    
}