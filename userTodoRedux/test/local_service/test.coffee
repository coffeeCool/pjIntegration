import 'shelljs/make'
import local_userService from '../../src/testServices/local_service'

target.local_userService = ->
  local_userService()
