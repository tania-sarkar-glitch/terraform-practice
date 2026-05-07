resource "local_file" "log" {
  filename = "${path.root}/system.log"
  content  = "Log Initialized at ${timestamp()}"
}
