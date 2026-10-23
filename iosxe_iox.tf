resource "iosxe_iox" "iox" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].iox, null) != null }
  device   = each.value.name

  enable = try(local.device_config[each.value.name].iox.enable, null)
}
