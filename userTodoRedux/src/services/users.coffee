import dd from 'ddeyes'

export default (
  config
) ->
  # create user
  create: (
    request
    data
  ) ->
    request config.create.uri()
    ,
      method: config.create.method
      headers: config.create.headers
      data: data

  # user login
  login: (
    request
    data
  ) ->
    request config.login.uri()
    ,
      method: config.login.method
      headers: config.login.headers
      data: data
  
  # fetch user
  fetch: (
    request
    data
  ) ->
    request (config.fetch.uri data)
    ,
      method: config.fetch.method
      headers: config.fetch.headers
      data: data

  # patch user
  patch: (
    request
    data
  ) ->
    request (config.patch.uri data)
    ,
      method: config.patch.method
      headers: (config.patch.headers data)
      data: data
  
  # reload user
  reload: (
    request
  ) ->
    request config.reload.uri()
    ,
      method: config.reload.method
      headers: config.reload.headers

  # remove user
  remove: (
    request
    data
  ) ->
    request (config.remove.uri data)
    ,
      method: config.remove.method
      headers: (config.remove.headers data)
      data: data
