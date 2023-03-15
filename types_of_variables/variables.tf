/*
variable content1 {
  type        = number
  default     = 23
  description = "description"
}

variable content1 {
  type        = bool
  default     = true
  description = "description"
}


variable content1 {
  type        = list(string)
  default     = ["green","red","white"]
  description = "description"
}
*/

variable content1 {
  type        = tuple([string,number,bool])
  default     = ["Raghu","29","true"]
  description = "description"
}


variable filename1 {
  type        = string
  default     = "sample.txt"
  description = "description"
}
