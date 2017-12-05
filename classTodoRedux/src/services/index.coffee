import config from './config'
import getClassService from './class'

export default
  lc:
    create: (getClassService config.lc.todos).create
    fetch: (getClassService config.lc.todos).fetch
    patch: (getClassService config.lc.todos).patch
    reload: (getClassService config.lc.todos).reload
    remove: (getClassService config.lc.todos).remove
  
  local:
    create: (getClassService config.local.todos).create
    fetch: (getClassService config.local.todos).fetch
    patch: (getClassService config.local.todos).patch
    reload: (getClassService config.local.todos).reload
    remove: (getClassService config.local.todos).remove