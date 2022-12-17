
resource "aws_instance" "this" {
    count                                   = var.ec2_count
    ami                                     = var.ami
    instance_type                           = var.instance_type
    hibernation                             = var.hibernation
    user_data                               = var.user_data
    user_data_base64                        = var.user_data_base64
    #user_data_replace_on_change             = var.user_data_replace_on_change
    subnet_id                               = var.subnet_id
    key_name                                = var.key_name
    instance_initiated_shutdown_behavior    = var.instance_initiated_shutdown_behavior
    placement_group                         = var.placement_group
    private_ip                              = var.private_ip
    get_password_data                       = var.get_password_data
    iam_instance_profile                    = var.iam_instance_profile
    associate_public_ip_address             = var.associate_public_ip_address

    dynamic "root_block_device" {
        for_each = var.root_block_device
        content {
            delete_on_termination = lookup(root_block_device.value, "delete_on_termination", true)
            encrypted             = lookup(root_block_device.value, "encrypted", false)
            iops                  = lookup(root_block_device.value, "iops", null)
            kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)
            volume_size           = lookup(root_block_device.value, "volume_size", 30)
            volume_type           = lookup(root_block_device.value, "volume_type", "gp2")
            throughput            = lookup(root_block_device.value, "throughput", null)
            tags                  = lookup(root_block_device.value, "tags", null)
        }
    }

    tags                                    = merge({ "Name" = var.name }, var.tags)
}