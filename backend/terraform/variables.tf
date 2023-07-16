variable "rgname" {
  type    = string
  default = "tfazresume-rg"
}

variable "location" {
  type    = string
  default = "west europe"
}

variable "storagename" {
  type    = string
  default = "tfazresumestorage"
}

variable "cosmosdbaccountname" {
  type    = string
  default = "tfazresume-db-account"
}

variable "cosmosdbname" {
  type    = string
  default = "tfazresume-db"
}

variable "cosmosdbcontainer" {
  type    = string
  default = "counter"
}

variable "functionname" {
  type    = string
  default = "tfazresume-function"
}

variable "serviceplanname" {
  type    = string
  default = "tfazresume-service-plan"
}

variable "appinsightsname" {
  type    = string
  default = "tfazresume-appinsights"
}

variable "loganalyticsworkspacename" {
  type    = string
  default = "tfazresume-workspace"
}
