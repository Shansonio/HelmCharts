registry: dk-dev.region.ru
name: appName1
imagePullSecret: dk
services:
- name: front
  global:
    identityServerUrl: Application__IdentityServerUrl
    environment: ASPNETCORE_ENVIRONMENT
  endpoint:
    host: dk.region.ru  
    tlsSecret: dk-region-ru 
  configs:
  - name: config
    value: base64_value
    env: environment_variable_name
  secrets:
  - name: secret
    value: encrypted_value
    env: environment_variable_name
- name: api
  global:
    identityServerUrl: Application__IdentityServerUrl
    environment: ASPNETCORE_ENVIRONMENT
  configs:
  - name: api-url
    value: api.dk.region.ru
    env: API_URL
  secrets:
  - name: connection-string
    value: encrypted_connection_string
    env: ConnectionStrings__DefaultConnection
  init: 
    args:
    - "-migration"
  dapr:
    auth:
      clientId: id
      clientSecretKey: secret
      scopes: scopes
  