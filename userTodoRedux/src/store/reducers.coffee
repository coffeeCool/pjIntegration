import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'
import userReducers from '../models/users/reducers'
import dd from 'ddeyes'

initialState =
  list: []

users = handleActions

  USER_SAVE: userReducers.save

, initialState

export default mergeReduce {
  users
}
, initialState
