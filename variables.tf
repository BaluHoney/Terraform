variable "rgname"{
    type = string
    description = "used for naming resource group"
}

variable "rglocation"{
    type = string
    description = "used for selecting the location"
    default = "West Europe"
}

variable "prefix"{
    type = string
    description = "used to define a standard prefix for all resources"
}