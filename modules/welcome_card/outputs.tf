output "card_path" {
  # This exports the path of the files created by this module
  value = [for f in local_file.welcome_files : f.filename]
}