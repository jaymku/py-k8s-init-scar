build:
			docker build --tag python-demo-web-api web-api
			docker build --tag python-demo-load load
remove: 
			docker rmi python-demo-web-api
			docker rmi python-demo-load
ns:
			kubectl create namespace dev
create_key:
			kubectl -n dev create secret generic \
			appd-agent-secret \
			--from-literal=access-key=<accesskey>
apply:
			kubectl -n dev apply -f kube

delete:
			kubectl -n dev delete -f kube
status: 
			kubectl -n dev get pods


# Run with following steps:
# The web-app will run in one pod, other pods is a sidecar going to generate load for your application. 
#1> make build
#2> make ns
#3> make create_key
#4> make apply
#5> make status