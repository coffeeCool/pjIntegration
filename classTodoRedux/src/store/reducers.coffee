import { reduxActions } from 'cfx.redux-actions'
{ handleActions } = reduxActions
import { mergeReduce } from 'cfx.redux'
import classReducers from '../models/class/reducers'
import dd from 'ddeyes'

initialState =
  list: []

classes = handleActions

  CLASS_SAVE: classReducers.save

, initialState

export default mergeReduce {
  classes
}
, initialState
