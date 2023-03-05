resource local_file sample_text {
  sensitive_content = "I love terraform"
  filename             = "${path.module}/files/outputfile"
  file_permission      = 0777
  directory_permission = 0777
}

resource local_file sample_res {
  filename             = "sample.txt"
  content              =  "I love Linux"
  file_permission      = 0777
  directory_permission = 0777
}
