resource local_file cat_res {
  filename             = "cat.txt"
  content               = "I Love Terraform"
  file_permission      = 0777
  directory_permission = 0777
}

resource local_file dog_res {
  filename             = "dog.txt"
  content              = "I Love Dogs"
  file_permission      = 0777
  directory_permission = 0777
}
