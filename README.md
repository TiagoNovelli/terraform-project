# Terraform - Guia de Comandos e Boas Práticas

## Sobre o Terraform

O Terraform é uma ferramenta de infraestrutura como código (IaC) que permite definir e provisionar recursos de infraestrutura usando uma linguagem de configuração declarativa.

## Recursos Úteis

- **Terraform Registry**: [https://registry.terraform.io/](https://registry.terraform.io/)
  - Repositório oficial com provedores e módulos pré-construídos
  - Documentação detalhada para cada recurso

## Estrutura de Projeto

### Organização Recomendada

```
projeto/
├── main.tf          # Configuração principal
├── variables.tf     # Declaração de variáveis
├── outputs.tf       # Outputs do projeto
├── providers.tf     # Configuração de provedores
└── modules/         # Módulos customizados
    ├── ec2/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── s3/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

**Melhor Prática**: Crie um arquivo separado para cada tipo de recurso para melhor organização e manutenibilidade.

## Comandos Principais

### 1. Inicialização

```bash
terraform init
```
- Inicializa o projeto Terraform
- Baixa provedores e módulos necessários
- Configura o backend de estado

### 2. Validação e Formatação

```bash
# Valida a sintaxe dos arquivos
terraform validate

# Formata e alinha o código
terraform fmt
```

### 3. Planejamento

```bash
# Gera plano de execução
terraform plan

# Plano com variáveis específicas
terraform plan -var="name=aula-criar-bucket"
```

### 4. Aplicação

```bash
# Aplica as mudanças (solicita confirmação)
terraform apply

# Aplica automaticamente sem confirmação
terraform apply --auto-approve
```

### 5. Destruição

```bash
# Destrói recursos (solicita confirmação)
terraform destroy

# Destrói automaticamente sem confirmação
terraform destroy --auto-approve
```

## Gerenciamento de Outputs

### Visualizar Outputs

```bash
# Lista todos os outputs
terraform output

# Output específico com aspas
terraform output ec2

# Output específico sem aspas
terraform output -raw ec2
```

### Usando Outputs em Scripts

```bash
# Captura output em variável
ec2_ip=$(terraform output -raw ec2_ip)
echo $ec2_ip
```

## Gerenciamento de Estado

### Listar Recursos

```bash
# Lista todos os recursos no estado
terraform state list
```

### Mover Recursos

```bash
# Renomear recurso no estado
terraform state mv aws_s3_bucket.nome_antigo aws_s3_bucket.nome_novo

# Mover recurso para outro arquivo de estado
terraform state mv -state-out="../destino/terraform.tfstate" aws_s3_bucket.nome_antigo aws_s3_bucket.nome_novo
```

## Passagem de Variáveis

### Métodos de Definição

1. **Via linha de comando:**
   ```bash
   terraform plan -var="name=aula-criar-bucket"
   terraform apply -var="environment=prod"
   ```

2. **Via arquivo .tfvars:**
   ```bash
   terraform plan -var-file="prod.tfvars"
   ```

3. **Via variáveis de ambiente:**
   ```bash
   export TF_VAR_name="aula-criar-bucket"
   terraform plan
   ```

## Workflow Recomendado

1. **Desenvolvimento:**
   ```bash
   terraform init
   terraform fmt
   terraform validate
   terraform plan
   ```

2. **Deploy:**
   ```bash
   terraform apply
   ```

3. **Verificação:**
   ```bash
   terraform output
   terraform state list
   ```

4. **Limpeza (quando necessário):**
   ```bash
   terraform destroy
   ```

## Dicas Importantes

- ⚠️ **Sempre revisar o plano** antes de aplicar mudanças
- 🔒 **Usar backends remotos** para armazenar o estado em produção
- 📁 **Organizar recursos** em arquivos separados por tipo
- 🔄 **Usar módulos** para reutilização de código
- 📋 **Documentar variáveis** com descrições e tipos
- 🧪 **Testar em ambiente separado** antes de aplicar em produção

## Exemplo Prático

```hcl
# variables.tf
variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
  default     = "meu-bucket-exemplo"
}

# main.tf
resource "aws_s3_bucket" "exemplo" {
  bucket = var.bucket_name
}

# outputs.tf
output "bucket_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.exemplo.arn
}
```

```bash
# Executar
terraform init
terraform plan -var="bucket_name=meu-bucket-unico"
terraform apply
terraform output bucket_arn
```