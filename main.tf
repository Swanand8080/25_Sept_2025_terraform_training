provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "myinstance1" {
        ami = var.ami        
        key_name = "Swanand_22_09_2025"
        instance_type = var.i-type
        availability_zone = var.az
        tags = {
                Name = "Swanand_instance"
        }
}

resource "aws_ebs_volume" "vol1" {
        availability_zone = var.az
        size              = var.ebs-size
        tags = {
                Name = "Terraform_vol_1"
        }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.vol1.id
  instance_id = aws_instance.myinstance1.id
}
