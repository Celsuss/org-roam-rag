
resource "helm_release" "ingres" {
  name       = "ingress"
  namespace  = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"

  values = [
    templatefile("${path.module}/values.yaml", {
      # storage = "4Gi"
    })
  ]
}
