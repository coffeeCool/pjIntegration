import source from '../config/config.default'
import dd from 'ddeyes'

export default (app) ->

  class usersService extends app.Service

    constructor: (ctx) ->
      super ctx
      @root = source.source.leanCloud.userBaseUri
      @

    request: (url, opts) ->
      url = "#{@root}#{url}"
      opts = {
        headers: {
          source.source.leanCloud.headers...
          (
            do ->
              if opts?.headers_extra?
              then opts.headers_extra
              else {}
          )...
        }
        opts...
      }
      await @ctx.curl url, opts

    # login
    login: (params) ->
      result = await @request "/login"
      ,
        method: 'post'
        data: params
        dataType: 'json'

      result.data

    # users
    reload: (params) ->
      result = await @request "/users"
      ,
        method: 'get'
        data: params
        dataType: 'json'

      result.data

    # fetch
    fetch: (params) ->
      result = await @request "/users/#{params.objectId}"
      ,
        data: params
        
      result.data

    # create
    create: (params) ->
      result = await @request "/users"
      ,
        method: 'post'
        data: params
        dataType: 'json'
      
      result.data

    # patch
    patch: (params) ->
      result = await @request "/users/#{params.objectId}?fetchWhenSave=true"
      ,
        method: 'put'
        data: params
        headers_extra:
          'X-LC-Session': "#{params.sessionToken}"
        dataType: 'json'

      result.data

    # remove
    remove: (params) ->
      result = await @request "/users/#{params.objectId}"
      ,
        method: 'delete'
        data: params
        headers_extra:
          'X-LC-Session': "#{params.sessionToken}"
        dataType: 'json'

      result.data
