registry: dk-dev.region.ru
name: appName
imagePullSecret: dk
services:
  front:
    mapEnvVars:
      identityServerUrl: IDENTITY_SERVER_URL
      environment: ENVIRONMENT
    endpoint:
      host: dk.region.ru  
      tlsSecret: dk-region-ru 
    configs:
    - name: config
      value: some_value
      env: environment_variable_name
    secrets:
    - name: secret
      value: encrypted_value
      env: environment_variable_name
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
    init: 
      args:
      - "-migration"
    dapr:
      auth:
        clientId: id
        clientSecretKey: secret
        scopes: scopes
      tracing:
        samplingRate: "1"
        endpointAddress: http://zipkin.tracing.svc.cluster.local:9411/api/v2/spans

  