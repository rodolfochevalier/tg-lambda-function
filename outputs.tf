output "function_name" {
  value       = module.lambda_function.lambda_function_name
  description = "The Lambda Function name"
}

output "function_arn" {
  value       = module.lambda_function.lambda_function_arn
  description = "The Lambda Function ARN"
}

output "invoke_arn" {
  value       = module.lambda_function.lambda_function_invoke_arn
  description = "The Lambda Function invoke ARN"
}