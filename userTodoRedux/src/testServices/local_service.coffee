import dd from 'ddeyes'
import toolFuc from '../utils/helper'
import services from '../services/index'

export default local_userService = ->
  # create user
  results = await services.local.create toolFuc
  ,
    username: '陈欢'
    password: '123456'
    phoneNo: '110'
  dd results

  # user login 
  data_login = await services.local.login toolFuc
  , 
    username: '陈欢'
    password: '123456'
  dd data_login

  # fetch user
  data_fetch = await services.local.fetch toolFuc
  ,
    objectId: data_login.objectId
  dd data_fetch

  # patch user
  data_patch = await services.local.patch toolFuc
  , 
    sessionToken: data_login.sessionToken
    objectId: data_login.objectId
    username: '何文涛'
    password: '123456'
    phoneNo: '119'
  data_patch
  dd data_patch

  # reload user
  data_reload = await services.local.reload toolFuc
  dd data_reload

  # remove user
  data_remove = await services.local.remove toolFuc
  , 
    sessionToken: data_patch.sessionToken
    objectId: data_patch.objectId
  dd data_remove

  # reload user
  data_reload = await services.local.reload toolFuc
  data_reload
  dd data_reload

  # remove all user
  ids = data_reload.results.reduce (r, c) ->
    [
      r...
      c.objectId
    ]
  , []
  for id in ids
    data_removeAll = await services.local.remove toolFuc
    ,
      sessionToken: data_patch.sessionToken
      objectId: id
    dd data_removeAll
