variable "prefix" {
  description = "To prefix the names of resource modules"
  type        = string
}

variable "aws_account_id" {
  description = "AWS Account Id"
  type        = string
}

variable "common_lambda_layer_arn" {
  description = "Common Lambda ayer ARN"
  type        = string
}

variable "github_token" {
  type = string
  description = "Github PAT (personal access token)"
}

variable "lambda_role_arn" {
  description = "The Lambda Role ARN"
  type        = string
}

variable "python_runtime" {
  description = "Python Lambda Runtime"
  type        = string
  default     = "python3.11"
}

variable "function_name" {
  description = "The Lambda function name"
  type        = string
}

variable "lambda_handler" {
  description = "The Lambda handler"
  type        = string
}

variable "environment_variables" {
  description = "Environment variable list"
  type        = map(string)
  default     = {}
}

variable "source_path" {
  description = "The path where source is present"
  type        = string
}

variable "pip_requirements" {
  description = "The path where requirements.txt is present"
  type        = string
}

variable "timeout" {
  description = "Amount of time your Lambda Function has to run in seconds."
  type        = number
  default     = 30
}

variable "force_redeployment" {
  type        = bool
  description = "Force the redeployment of the Lambda function"
  default     = true
}

variable "log_retention_in_days" {
  description = "The number of days you want to retain log events in the specified log group"
  type        = number
  default     = 1
}