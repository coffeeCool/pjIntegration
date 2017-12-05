export default (app) ->
  # leancloud todo
  app.post '/todos', app.controller.todo.create
  app.get '/todos/:id', app.controller.todo.fetch
  app.put '/todos/:id', app.controller.todo.patch
  app.get '/todos', app.controller.todo.reload
  app.delete '/todos/:id', app.controller.todo.remove

  # leancloud user
  app.post '/login', app.controller.user.login
  app.post '/users', app.controller.user.create
  app.get '/users/:id', app.controller.user.fetch
  app.put '/users/:id', app.controller.user.patch
  app.get '/users', app.controller.user.reload
  app.delete '/users/:id', app.controller.user.remove

  # wechat test
  app.get '/oauth', app.controller.wechat.oauth
  app.get '/access_token', app.controller.wechat.access_token
  app.post '/menu', app.controller.wechat.menu

  app.get '/test', app.controller.wechat.test