resource "aws_launch_configuration" "foobar" {
  name_prefix     = format("%s_lc_", local.prefix_name)
  image_id        = data.aws_ami.ubuntu.id
  instance_type   = lookup(local.instance_type, var.environment)
  security_groups = [aws_security_group.asg.id]
  user_data       = file("${path.module}/user-data/bootstrap.sh")
  # path module, vai dentro do diretorio do modulo
  # aquele campo para inserir um prompt na interface do usuário na criação do ec2

  lifecycle {
    create_before_destroy = true
    # primeiro cria um novo recurso e depois destroi o antigo
    # o defalt é falso
  }
}