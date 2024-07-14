Kubernetes Deployment:

1) Deploy the services to a local Kubernetes cluster (e.g., Minikube or Kind).

2) Deploy the frontent and backent deployment and services using command:
kubectl apply -f frontend-service.yaml
kubectl apply -f backend-service.yaml
kubectl apply -f backend-deployment.yaml
kubectl apply -f frontend-deployment.yaml

3) Make sure all the pods and services are up and running and has external ip

4) Get minikube ip address and node port port curl and put it in browser

5) Run bash script using command: ./integration.sh

6) Output should display 
Integartion tests has been passed



7) Run health.sh and app.sh to check health monitoring and app monitoring script on linunx system
