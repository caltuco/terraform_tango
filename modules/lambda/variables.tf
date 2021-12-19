variable "function_name" {
  type = string
}

variable "description" {
  type = string
}

variable "handler" {
  type    = string
}

variable "runtime" {
  type    = string
}

variable "source_path" {
  type    = string
}

variable "environment_variables" {
  type = map(string)
}

variable "attach_policy_jsons" {
  type = bool
  default = false
}

variable "policy_jsons" {
  type = list
  default = []
}

variable "number_of_policy_jsons" {
  type = number
  default = 0
}
