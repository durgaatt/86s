data "aws_instances" "info" {

  filter {
    name   = "instance-state-name"
    values = ["pending", "running", "stopping", "stopped"]
  }
}

# resource "aws_ec2_instance_state" "stop_running" {
#   for_each    = toset(data.aws_instances.info.ids)
#   instance_id = each.value
#   state       = "stopped"
# }

resource "aws_ec2_instance_state" "start_instances" {
  for_each    = toset(data.aws_instances.info.ids)
  instance_id = each.value
  state       = "running"
}