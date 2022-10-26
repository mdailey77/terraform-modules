
resource "aws_instance" "ec2" {
    count = local.create
    ami = var.ami
    instance_type = var.instance_type
    cpu_core_count       = var.cpu_core_count
    cpu_threads_per_core = var.cpu_threads_per_core
    hibernation          = var.hibernation

    user_data                   = var.user_data
    user_data_base64            = var.user_data_base64
    user_data_replace_on_change = var.user_data_replace_on_change
    subnet_id              = var.subnet_id
    key_name             = var.key_name
    monitoring           = var.monitoring
    get_password_data    = var.get_password_data
    iam_instance_profile = var.iam_instance_profile
    associate_public_ip_address = var.associate_public_ip_address
}