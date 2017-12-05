import dd from 'ddeyes'
import 'shelljs/make'
import redux_test from '../../src/testServices/redux'

target.all = ->
  dd 'Hello classTodoRedux ！'

target.static = ->
  redux_test.staticFuc()

target.reducers = ->
  redux_test.reducersFuc()

target.sagas = ->
  data = await redux_test.createFuc()
  data

  await redux_test.fetchFuc data

  data_patch = await redux_test.patchFuc data
  data_patch

  data_reload = await redux_test.reloadFuc()
  data_reload

  await redux_test.removeFuc data.objectId

  # ids = await redux_test.getIds(data_reload.results)
  # for id in ids
  #   await redux_test.removeFuc id