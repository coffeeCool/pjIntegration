import config from '../config/config.default'
import sha1 from 'sha1'
import dd from 'ddeyes'

export default (app) ->

  class usersService extends app.Service

    constructor: (ctx) ->
      super ctx
      @

    request: (url) ->
      url = "#{url}"
      await @ctx.curl url

    # wechat 鉴权
    oauth: (params) ->
      token = config.source.wechat.token
      timetamp = params.timetamp
      nonce = params.nonce
      echostr = params.echostr
      signature = params.signature
      str = [token, timetamp, nonce].sort().join ''
      result = sha1 str
      if result is signature
        @ctx.body = echostr + ''
    
    # 获取 token
    access_token: (params)->
      grant_type = config.source.wechat.grant_type
      appId = config.source.wechat.appId
      appSecret = config.source.wechat.appSecret

      result = await @request "https://api.weixin.qq.com/cgi-bin/token?grant_type=#{grant_type}&appid=#{appId}&secret=#{appSecret}"
      ,
        method: 'get'
        data: params
        dataType: 'json'
      buf = new Buffer result.data
      dd buf.toString()
      buf.toString()
      

    # 设置菜单
    menu: (params) ->
      result = await @request "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN"
      ,
        method: 'post'
        data: params
        dataType: 'json'
      
      result.data
    