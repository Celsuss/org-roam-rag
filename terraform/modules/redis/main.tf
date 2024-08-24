
resource "helm_release" "redis" {
  name       = "redis"
  namespace  = "orr-ns"
  repository = "https://charts.bitnami.com/bitnami"
  repository = "oci://registry-1.docker.io/bitnamicharts/redis"
  chart      = "redis"

  values = [
    templatefile("${path.module}/values.yaml", {
      # storage = "4Gi"
    })
  ]
}
