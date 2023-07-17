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

variable "cdnprofilename" {
  type    = string
  default = "tfazresume-cdn-profile"
}

variable "cdnendpointname" {
  type    = string
  default = "tfazresume"
}


variable "imagefiles" {
  type    = list(string)
  default = ["az104.png", "az900.png", "github.png", "linkedin.png", "twitter.png", "me.png", "cloud.png", "cloud1.png",]
}

variable "htmlfile" {
  type    = string
  default = "index.html"
}

variable "cssfile" {
  type    = string
  default = "css/style.css"
}

variable "jsfile" {
  type    = string
  default = "js/get_counter.js"
}