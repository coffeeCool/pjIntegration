import { getStore } from 'cfx.redux'

import constants from './constants'
import actions from './actions'
import reducers from './reducers'
import sagas from './sagas'

store = getStore {
  appName: 'userTodoRedux'
  reducers
  sagas
}

export {
  constants
  actions
  reducers
  sagas
  getStore
  store
}
