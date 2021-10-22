global: # optional
  registry: dk-dev.region.ru # optional: will be applied if service has no registry specified
  imagePullSecret: dk # optional: will be applied if service has no imagePullSecret specified

#Release.Name = app.Name
#set of services

front: #service name
  registry: dk-dev.region.ru # optional: image registry
  imagePullSecret: dk # optional: registry password
  mapEnvVars: #optional: map environment variavles to env variables service container
    identityServerUrl: IDENTITY_SERVER_URL 
    environment: ENVIRONMENT # Development/Staging/Production
  endpoint: # required for Angular apps
    host: dk.region.ru  
    tlsSecret: dk-region-ru 
  configs: # services settings will be placed in ConfigMap
  - name: config # setting name in config map
    value: some_value # setting value
    env: environment_variable_name # service container environmnt variable in which setting will be mapped
  secrets: # services settings will be placed in Secret
  - name: secret # secret name in Secret
    value: encrypted_value # secret value
  registry: dk-dev.region.ru # optional: image registry
  imagePullSecret: dk # optional: registry password

api
  mapEnvVars:
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
  - name: secret
    value: encrypted_secret
  init: # init container should be started
    args: 
    - "-migration" # argument to launch database migration
  dapr: # dapr additional config
    auth: # authentication for service invocation
      clientId: id
      clientSecretKey: secret
      scopes: scopes
    tracing: # tracing
      samplingRate: "1"
      endpointAddress: http://zipkin.tracing.svc.cluster.local:9411/api/v2/spans

  