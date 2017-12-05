import config from './config'
import getUserService from './users'

export default
  lc:
    create: (getUserService config.lc.todos).create
    login: (getUserService config.lc.todos).login
    fetch: (getUserService config.lc.todos).fetch
    patch: (getUserService config.lc.todos).patch
    reload: (getUserService config.lc.todos).reload
    remove: (getUserService config.lc.todos).remove

  local:
    create: (getUserService config.local.todos).create
    login: (getUserService config.local.todos).login
    fetch: (getUserService config.local.todos).fetch
    patch: (getUserService config.local.todos).patch
    reload: (getUserService config.local.todos).reload
    remove: (getUserService config.local.todos).remove

