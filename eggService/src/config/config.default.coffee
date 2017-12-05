export default (appInfo) ->
  config = {}
  config.keys = appInfo.name + 'eggService'
  config.middleware = [ 'errorHandler' ]

  config.security =
    csrf:
      enable: false
  config