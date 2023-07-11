variable "rgname" {
  type    = string
  default = "resume-rg"
}

variable "location" {
  type    = string
  default = "west europe"
}

variable "cosmosdbaccountname" {
  type    = string
  default = "resumeacct"
}

variable "cosmosdbname" {
  type    = string
  default = "resume-db"
}

variable "cosmosdbcontainer" {
  type    = string
  default = "counter"
}

variable "functionname" {
  type    = string
  default = "azureresume-function"
}

variable "serviceplanname" {
  type    = string
  default = "resume-service-plan"
}