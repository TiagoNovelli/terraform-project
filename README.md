\# 📘 Guia Rápido Terraform



Este guia reúne os principais comandos e boas práticas para organizar e executar seu código Terraform de forma eficiente.



---



\## 🗂️ Organização de Arquivos



\- Crie \*\*um arquivo `.tf` separado para cada recurso\*\* (por exemplo: `vpc.tf`, `ec2.tf`, `s3.tf`, etc.).

\- Utilize os arquivos padrão para manter o projeto limpo:

&nbsp; - `main.tf` – definição geral dos recursos

&nbsp; - `variables.tf` – definição de variáveis

&nbsp; - `outputs.tf` – definição de outputs

&nbsp; - `provider.tf` – configuração do provider



---



\## 🛠️ Comandos Básicos



| Comando                    | Função                                                     |

|---------------------------|------------------------------------------------------------|

| `terraform init`          | Inicializa o projeto e baixa os providers necessários.     |

| `terraform validate`      | Valida a sintaxe dos arquivos `.tf`.                      |

| `terraform fmt`           | Alinha e formata o código de forma padronizada.           |

| `terraform plan`          | Mostra as ações que serão executadas na infraestrutura.   |

| `terraform apply`         | Executa o `plan` e aplica as alterações.                  |

| `terraform destroy`       | Mostra o plano de destruição da infraestrutura.           |



\### Sem confirmação manual (modo automático):



```bash

terraform apply --auto-approve

terraform destroy --auto-approve

```



---



\## 🔧 Variáveis



Você pode passar variáveis diretamente na linha de comando:



```bash

terraform plan -var="name=aula-criar-bucket"

```



---



\## 📤 Outputs



| Comando                             | Descrição                                     |

|------------------------------------|-----------------------------------------------|

| `terraform output`                 | Exibe todos os outputs definidos.             |

| `terraform output ec2`             | Exibe o output específico `ec2` com aspas.    |

| `terraform output -raw ec2`        | Exibe o output específico `ec2` sem aspas.    |



\### Exemplo em Shell Script:



```bash

ec2\_ip=$(terraform output -raw ec2\_ip)

echo $ec2\_ip

```



---



\## 🧾 Gerenciamento do Estado (`terraform.tfstate`)



| Comando                                                                 | Função                                               |

|-------------------------------------------------------------------------|------------------------------------------------------|

| `terraform state list`                                                  | Lista os recursos gerenciados no state.             |

| `terraform state mv origem destino`                                     | Move um recurso para outro nome no state.           |

| `terraform state mv -state-out="../destino/terraform.tfstate" origem destino` | Move um recurso para outro arquivo de state.        |



\### Exemplo:



```bash

terraform state mv aws\_s3\_bucket.nome\_antigo aws\_s3\_bucket.nome\_novo

```



---



\## 🌐 Referência Oficial



\- Acesse a documentação oficial dos módulos e recursos em:  

🔗 \[https://registry.terraform.io](https://registry.terraform.io)



