provider "aws" {
  region = "${var.AWS_REGION}"
}

resource "aws_instance" "indexer" {
ami = "${var.AWS_AMI}"
instance_type = "${var.AWS_INS_TYPE}"
key_name = "${var.AWS_KEY_NAME}"
vpc_security_group_ids= ["${aws_security_group.aws_index_sg.id}"]
subnet_id = "${var.AWS_SUBNET_ID}"
user_data = "${file("install.sh")}"
iam_instance_profile= "${var.INSTANCE_ROLE}"
}

resource "aws_security_group" "aws_index_sg" {
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
