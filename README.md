# org-roam-rag
RAG functionality for org-roam
## Development
### Set postgres
Use terraform to start postgres in minikube and use port forward
to access postgres.
``` bash
kubectl port-forward postgres-postgresql-0 -n orr-ns 5432:5432
```
