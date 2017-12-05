import { sagaEffects } from 'cfx.redux-saga'
import dd from 'ddeyes'
import constants from './constants'
import config from '../services/config'
import getClassSagas from '../models/class/effects'

classSagas = getClassSagas
  type:
    save: 'CLASS_SAVE'
    fetch: 'CLASS_FETCH'
    remove: 'CLASS_REMOVE'
    patch: 'CLASS_PATCH'
    create: 'CLASS_CREATE'
    reload: 'CLASS_RELOAD'
  
{
  put
  takeLatest
} = sagaEffects

{
  CLASS_FETCH
  CLASS_REMOVE
  CLASS_PATCH
  CLASS_CREATE
  CLASS_RELOAD
} = constants.types

classes =

  fetch: (action) ->
    action.payload = {} unless action.payload?
    classSagas.fetch action
    , {
      put
    }

  remove: (action) ->
    classSagas.remove action
    , {
      put
    }

  patch: (action) ->
    classSagas.patch action
    , {
      put
    }

  create: (action) ->
    classSagas.create action
    , {
      put
    }

  reload: (action) ->
    classSagas.reload action
    , {
      put
    }

export default [
  ->
    yield takeLatest CLASS_FETCH
    , classes.fetch
  ->
    yield takeLatest CLASS_REMOVE
    , classes.remove
  ->
    yield takeLatest CLASS_PATCH
    , classes.patch
  ->
    yield takeLatest CLASS_CREATE
    , classes.create
  ->
    yield takeLatest CLASS_RELOAD
    , classes.reload
]
