resource local_file sample_res {
  sensitive_content = var.content1("["2","1"]")
  filename             = var.filename1
  file_permission      = 0777
  directory_permission = 0777
}
