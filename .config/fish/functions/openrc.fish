function openrc  --description 'set variables for CERN OpenStack'
# Unset variables to allow it to work on aiadm
  set -eU OS_IDENTITY_API_VERSION
  set -eU OS_PROJECT_DOMAIN_ID
  set -eU OS_USER_DOMAIN_ID
  set -eU OS_AUTH_TYPE

# To use an OpenStack cloud you need to authenticate against the Identity
# service named keystone, which returns a **Token** and **Service Catalog**.
# The catalog contains the endpoints for all services the user/tenant has
# access to - such as Compute, Image Service, Identity, Object Storage, Block
# Storage, and Networking (code-named nova, glance, keystone, swift,
# cinder, and neutron).
#
# *NOTE*: Using the 3 *Identity API* does not necessarily mean any other
# OpenStack API is version 3. For example, your cloud provider may implement
# Image API v1.1, Block Storage API v2, and Compute API v2.0. OS_AUTH_URL is
# only for the Identity API served through keystone.
  set -xU OS_AUTH_URL https://keystone.cern.ch/v3

# With the addition of Keystone we have standardized on the term **project**
# as the entity that owns the resources.
  set -xU OS_PROJECT_ID 96b97713-9601-4112-9e37-8f799f865c3c
  set -xU OS_PROJECT_NAME "wlcg-iam"
  set -xU OS_USER_DOMAIN_NAME "Default"
  if test -z "$OS_USER_DOMAIN_NAME"; set -eU OS_USER_DOMAIN_NAME; end

  set -x OS_PROJECT_DOMAIN_ID "default"
  if test -z "$OS_PROJECT_DOMAIN_ID"; set -eU OS_PROJECT_DOMAIN_ID; end

# unset v2.0 items in case set
  set -eU OS_TENANT_ID
  set -eU OS_TENANT_NAME

# In addition to the owning entity (tenant), OpenStack stores the entity
# performing the action as the **user**.
  set -xU OS_USERNAME "bbalci"

# With Keystone you pass the keystone password.
  echo "Please enter your OpenStack Password for project $OS_PROJECT_NAME as user $OS_USERNAME: "
  read -s OS_PASSWORD_INPUT
  set -xU OS_PASSWORD $OS_PASSWORD_INPUT

# If your configuration has multiple regions, we set that information here.
# OS_REGION_NAME is optional and only valid in certain environments.
  set -xU OS_REGION_NAME "cern"

# Don't leave a blank variable, unset it if it was empty
  if test -z "$OS_REGION_NAME"; set -eU OS_REGION_NAME; end

  set -xU OS_INTERFACE public
  set -xU OS_IDENTITY_API_VERSION 3
  set -xU KUBECONFIG /home/berk/config

end
