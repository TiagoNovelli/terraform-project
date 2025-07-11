https://registry.terraform.io/

# criar um arquivo para cada recurso
# rodar terraform init no terminal e o 
# terraform validat para ver se a sintaxe está certa
# terraform fmt verifica a alinhação do arquivo
# terraform plan para a criação, gera um output de tudo q vai ser executado
# terraform apply para executar a criação (tambem cria o plan e depois pede uma validação)
# terraform destroy traz um plan do q vai ser destruido e pede validação
# terraform destroy --auto-approve ou apply --auto-approve
# para passar o nome de variaveis solicitadas terraform plan -var="name=aula-criar-bucket" por exemplo
# terraform output - trás todos os outputs
# terraform output ec2 - tras exatamente esse output com aspas
# terraform output - row ec2 tras exatamente esse output sem aspas
# $ec2_ip=$(terraform terraform output - row ec2_ip)
# echo $ec2_ip retorna o valor dessa varivel criada
# terraform state list - lista os recursos criados

## Movendo recursos
# terraform state mv origin destino 
# terraform state mv aws_s3_bucket.nome_antigo aws_s3_bucket.nome_novo
# para mudar o arquivo de local (state):
terraform state mv -state-out="../destino/terraform.tfstate aws_s3_bucket.nome_antigo aws_s3_bucket.nome_novo