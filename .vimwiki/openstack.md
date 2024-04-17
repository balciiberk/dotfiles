rm config
source ~/.openrc
#$(openstack coe cluster config load-test) #k8s-wlcg-dev-c-v25)
$(openstack coe cluster config ops-auth-cluster)
kubectl config set-context --current --namespace=ops-auth
OPS

rm config
source ~/.openrc
$(openstack coe cluster config dteam-auth-cluster)
kubectl config set-context --current --namespace=dteam-auth
DTEAM







kubectl create secret docker-registry gitlab-token-auth \
  --docker-server=https://gitlab-registry.cern.ch \
  --docker-username="bbalci" \
  --docker-password="glpat-yx4FEezUKvDKpANXry3A" \
  --docker-email="berk.balci@cern.ch"



#PROGRESS

## create keypair

openstack coe cluster create mykubcluster --keypair mykey --cluster-template kubernetes-1.25.3-3  --node-count 2

## create a cluster:

source .openrc # TODO write how to get the file
eval $(ai-rc "wlcg-iam")
openstack coe cluster create dteam-auth-cluster  --keypair wlcg-iam \
  --cluster-template kubernetes-1.27.6-2 --node-count 4 \
  --merge-labels \
  --labels cern_enabled=true \
  --labels oidc_enabled=true \
  --labels logging_producer=wlcgauth \
  --labels logging_include_internal=true \
  --labels ingress_controller=nginx \
  --master-flavor=m2.large \
  --flavor=m2.large
  

#enable stream for the ingress controller (OR NOT)

kubectl edit ds -n kube-system cern-magnum-ingress-nginx-controller

and add:

spec:
  template:
    spec:
      containers:
      - args:
          ...
	  - --tcp-services-configmap=ops-auth/ops-auth-tcp-services

## db  
  
  
CREATE DATABASE wlcgauthdevdb CHARACTER SET latin1 COLLATE latin1_swedish_ci;
CREATE USER 'wlcgauthdevdb' IDENTIFIED BY 'asldiufasioldf';
GRANT ALL PRIVILEGES on wlcgauthdevdb.* to 'wlcgauthdevdb'@'%';


## login to container

$(openstack coe cluster config wlcg-dev-cluster)

## start instance

cd PROJECT_DIR
kubectl apply -k .


## load balancing

### loadbalancing with ingress:

- cluster setup for ingress
  
kubectl label node mycluster-7xdvoefvuz2l-minion-0 role=ingress

- add DNS aliases in LanDB

  - for load balancing:

openstack server set --property landb-alias=myclusterdns--load-1- mycluster-7xdvoefvuz2l-minion-0
openstack server set --property landb-alias=myclusterdns--load-2- mycluster-7xdvoefvuz2l-minion-1

  - for single node ingress:

openstack server set --property landb-alias=wlcg-auth-dev mycluster-7xdvoefvuz2l-minion-0
openstack server set --property landb-alias="ops-auth,voms-ops-auth" ops-auth-cluster-dyg7gx26h7cm-node-0


note: labdb-alias should match with 

spec:
  rules:
  - host: myclusterdns.cern.ch

at the nginx ingress

### loadbalancing with a service

- add aliases

$ openstack server unset --property landb-alias myservice01
$ openstack server set --property landb-alias=myservice myservice02


openstack server unset --property landb-alias NGINX_SERVICE_NAME
openstack server set --property landb-alias=PROJECT_NAME NGINX_SERVICE_NAME

openstack server set --property lanbd-alias=wlcg-auth-dev wlcg-auth-dev-nginx-public-service

## run the trusted anchors cron job

kubectl create job --from=cronjob/PROJECT_NAME-trust-anchors trust-initial-job

kubectl create job --from=cronjob/wlcg-auth-dev-trust-anchors trust-initial-job

## setup

admin password
change password
set test client


# error

Message:          The node was low on resource: ephemeral-storage. Container flume-logger was using 228Ki, which exceeds its request of 0. Container iam-login-service was using 784Ki, which exceeds its request of 0.
