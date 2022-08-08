resource "aws_instance" "web" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = "t2.micro"
    security_groups = [module.sg.sg_name]
    user_data = file("./web/server-script.sh")
    tags = {
        Name = "Web Server"
    }
}

output "pub_ip" {
    value = module.eip.PublicIP
}

    # This module is a child module because we are calling it in another module and the ../ means it is 2 directories back
module "eip" {
    source = "../eip"
    instance_id = aws_instance.web.id
}

module "sg" {
    source = "../sg"
}
