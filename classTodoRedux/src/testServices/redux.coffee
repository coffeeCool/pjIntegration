import dd from 'ddeyes'
import isEqual from 'is-equal'
import * as store from '../store'

{
  constants
  actions
  reducers
  sagas
  getStore
} = store

subscriber = (
  prevState
  nextState
  action
  dispatch
) ->
  unless action.type isnt 'CLASS_SAVE'
    return dd @getState() if not isEqual prevState, nextState
  unless action.type isnt 'CLASS_FETCH'
    return dd @getState()
  
myStore = getStore {
  appName: 'classTodoApp'
  reducers
  sagas
  subscriber:
    async: subscriber
}

# static 
staticFuc = ->
  dd {
    constants
    actions
  }

# reducers 
reducersFuc = ->
  myStore = getStore {
    appName: 'classTodoApp'
    reducers
    subscriber:
      sync: ->
        dd myStore.getState()
  }
  myStore.dispatch actions.classSave
    data: [
      company: '武汉举手帮租有限公司'
      main: '旅游、租房'
      location: '武汉'
    ]
  myStore.onsubscribe()

# create class  
createFuc = ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.classCreate 
      data:
        company: '湖北和风和乐有限公司'
        main: '旅游、租房'
        location: '武汉'
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

# fetch class
fetchFuc = (data) ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.classFetch
      data:
        objectId: data.objectId
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

# patch class
patchFuc = (data) ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.classPatch
      data:
        objectId: data.objectId
        company: '阿里巴巴有限公司'
        main: '租房大佬'
        location: '武汉'
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

# reload class
reloadFuc = ->
  new Promise (resolve, reject) ->
    myStore.dispatch actions.classReload
      data: ''
      callback:
        success: (data) ->
          resolve data
        fail: (data) ->
          reject data

# remove class
removeFuc = (data) ->
  myStore.dispatch actions.classRemove
    objectId: data

# get ids
getIds = (data) ->
  data.reduce (r, c) ->
    [
      r...
      c.objectId
    ]
  , []

export default redux_test = {
  createFuc
  fetchFuc
  patchFuc
  reloadFuc
  removeFuc
  getIds
  reducersFuc
  staticFuc
}