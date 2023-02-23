# py-k8s-init-scar
python web app using init method to instrument the app

== Build & Run

. Build all images
+
[source, sh]
----
docker build --tag python-demo-web-api web-api
docker build --tag python-demo-load load
----


. Create kubernetes namespace
+
[source, sh]
----
kubectl create namespace dev
----

. Update the Config in file kube/appd-python-config.yaml_
+ 
[source, sh]
----
apiVersion: v1
data:
  APPDYNAMICS_AGENT_APPLICATION_NAME: "<agent-application-name>"
  APPDYNAMICS_AGENT_REUSE_NODE_NAME: "true"
  APPDYNAMICS_AGENT_ACCOUNT_NAME: "<agent-account-name>"
  APPDYNAMICS_CONTROLLER_HOST_NAME: "<controller-host-name>"
  APPDYNAMICS_CONTROLLER_PORT: "<controller-port>"
  APPDYNAMICS_CONTROLLER_SSL_ENABLED: "<true|false>"
kind: ConfigMap
metadata:
  name: appd-python-config
----


. Create Access Key Secret
+
[source, sh]
----
kdev create secret generic \
    appd-agent-secret \
    --from-literal=access-key=<access key>
----

. Run environment
+
[source, sh]
----
kubectl -n dev apply -f kube
----
