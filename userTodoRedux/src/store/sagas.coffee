import { sagaEffects } from 'cfx.redux-saga'
import dd from 'ddeyes'
import constants from './constants'
import getUserSagas from '../models/users/effects'

userSagas = getUserSagas
  type:
    save: 'USER_SAVE'
    fetch: 'USER_FETCH'
    remove: 'USER_REMOVE'
    patch: 'USER_PATCH'
    create: 'USER_CREATE'
    login: 'USER_LOGIN'
    reload: 'USER_RELOAD'
  
{
  put
  takeLatest
} = sagaEffects

{
  USER_FETCH
  USER_REMOVE
  USER_PATCH
  USER_CREATE
  USER_LOGIN
  USER_RELOAD
} = constants.types

users =

  fetch: (action) ->
    action.payload = {} unless action.payload?
    userSagas.fetch action
    , {
      put
    }

  remove: (action) ->
    userSagas.remove action
    , {
      put
    }

  patch: (action) ->
    userSagas.patch action
    , {
      put
    }

  create: (action) ->
    userSagas.create action
    , {
      put
    }
  
  login: (action) ->
    userSagas.login action
    , {
      put
    }

  reload: (action) ->
    userSagas.reload action
    , {
      put
    }

export default [
  ->
    yield takeLatest USER_FETCH
    , users.fetch
  ->
    yield takeLatest USER_REMOVE
    , users.remove
  ->
    yield takeLatest USER_PATCH
    , users.patch
  ->
    yield takeLatest USER_CREATE
    , users.create
  ->
    yield takeLatest USER_LOGIN
    , users.login
  ->
    yield takeLatest USER_RELOAD
    , users.reload
]
