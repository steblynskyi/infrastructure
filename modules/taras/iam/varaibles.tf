variable "username" {
  description = "Desired name for the IAM user"
  type        = string
}

variable "system_path" {
  description = "Desired path for the IAM user"
  type        = string
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  default     = false
}

variable "policy" {
  description = "Name and policy content"
  default= {}
  type = map(object({
    name    = string
    content = string
  }))
}

variable "managed_policy" {
  description = "Name and managed policy content"
  default= {}
  type = map(object({
    name    = string
    content = string
  }))
}
