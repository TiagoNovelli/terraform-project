data "archive_file" "code" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "outputs/lambda_function.zip"
  # primeiro tem q subir o app pra depois iniciar terraform e gerar o zip
}