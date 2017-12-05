import 'shelljs/make'
import dd from 'ddeyes'
import redux_test from '../../src/testServices/redux'

target.all = ->
  dd 'hello userTodoRedux ！'

target.static = ->
  redux_test.staticFuc()

target.reducers = ->
  redux_test.reducersFuc()

target.sagas = ->
  data = await redux_test.createFuc()
  data

  await redux_test.loginFuc data

  await redux_test.fetchFuc data

  await redux_test.reloadFuc()

  data_patch = await redux_test.patchFuc data
  data_patch

  await redux_test.removeFuc data_patch
