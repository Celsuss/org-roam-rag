
resource "kubernetes_namespace" "org-roam-rag-namespace" {
  metadata {
    name = "orr-ns"
  }
}

module "postgres" {
  source = "./modules/postgres"
}
