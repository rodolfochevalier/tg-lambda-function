#############################
# Axons python commons layer
#############################

data "aws_lambda_layer_version" "common_lambda_layer" {
  layer_name = var.layer_name
}

module "lambda_function" {
  source                            = "terraform-aws-modules/lambda/aws"
  function_name                     = var.function_name
  runtime                           = var.python_runtime
  handler                           = var.lambda_handler
  build_in_docker                   = true
  create_role                       = false
  lambda_role                       = var.lambda_role_arn
  create_layer                      = false
  layers                            = [
    "${data.aws_lambda_layer_version.common_lambda_layer.arn}"
  ]
  cloudwatch_logs_retention_in_days = var.log_retention_in_days
  artifacts_dir             = "${path.root}/.builds/${var.function_name}/"
  source_path = [
    {
      path             = var.source_path
      pip_requirements = var.pip_requirements
    }
  ]
  docker_additional_options = [
      "--platform", "linux/amd64"
  ]
  environment_variables = var.environment_variables
  timeout               = var.timeout
  hash_extra            = var.force_redeployment ? "${var.function_name}?v=${timestamp()}" : var.function_name

  depends_on = [
    data.aws_lambda_layer_version.common_lambda_layer
  ]
}

resource "aws_lambda_function_event_invoke_config" "lambda_function_invoke_config" {
  function_name          = module.lambda_function.lambda_function_name
  maximum_retry_attempts = 0
}
