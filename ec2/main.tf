
resource "aws_instance" "this" {
    count                                   = var.ec2_count
    ami                                     = var.ami
    instance_type                           = var.instance_type
    hibernation                             = var.hibernation
    user_data                               = var.user_data
    user_data_base64                        = var.user_data_base64
    user_data_replace_on_change             = var.user_data_replace_on_change
    subnet_id                               = var.subnet_id
    key_name                                = var.key_name
    instance_initiated_shutdown_behavior    = var.instance_initiated_shutdown_behavior
    placement_group                         = var.placement_group
    private_ip                              = var.private_ip
    get_password_data                       = var.get_password_data
    iam_instance_profile                    = var.iam_instance_profile
    associate_public_ip_address             = var.associate_public_ip_address

    root_block_device {
        delete_on_termination               = var.delete_termination
        volume_size                         = var.volume_size
        volume_type                         = var.volume_type
    }

    tags                                    = merge({ "Name" = var.name }, var.tags)
}