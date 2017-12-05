export default (app) ->

  class TodosController extends app.Controller
  
    constructor: (ctx) ->
      super ctx
      @

    create: ->
      { ctx } = @
      
      ctx.body = await ctx.service.todo.create ctx.request.body

    fetch: ->
      { ctx } = @
      
      ctx.body = await ctx.service.todo.fetch ctx.request.body
      
    reload: ->
      { ctx } = @
      
      # 下次要修改掉
      body = { className: 'Todos' }
      ctx.body = await ctx.service.todo.reload body

    patch: ->
      { ctx } = @
      
      ctx.body = await ctx.service.todo.patch ctx.request.body

    remove: ->
      { ctx } = @

      ctx.body = await ctx.service.todo.remove ctx.request.body
        

  return TodosController