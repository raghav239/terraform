resource local_file variable_file {
  sensitive_content = var.content1
  filename             = var.filename1
  file_permission      = 0777
  directory_permission = 0777
}

resource local_file variable_file2 {
  sensitive_content = var.content2
  filename             = var.filename2
  file_permission      = 0777
  directory_permission = 0777
}

