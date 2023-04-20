variable "ibmcloud_api_key" {
  type        = string
  description = "Your IBM Cloud API Key"
  sensitive   = true
}

variable "ibmcloud_region" {
  type        = string
  description = "Region in which to provision the resources"
}

variable "resource_group" {
  type        = string
  default     = "Default"
  description = "Resource group in which to provision the resources"
}

variable "ce_project_name" {
  description = "Desired name for your Code Engine project"
  type        = string
  default     = "my-code-engine-project"
}

variable "cr_namespace" {
  type        = string
  default     = "my-cr-namespace"
  description = "Your IBM Cloud Container Registry namespace"
}

variable "image_name" {
  type        = string
  default     = "my_image"
  description = "Name of the output image"
}

variable "icr_access_secret" {
  type        = string
  description = "The access secret for your IBM Container Registry"
}

variable "source_code_url" {
  type        = string
  default     = "https://github.com/Plantaa/icos-object-restorer"
  description = "The repository URL for the source code"
}
