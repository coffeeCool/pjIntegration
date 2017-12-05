export default (app) ->

  class UsersController extends app.Controller
  
    constructor: (ctx) ->
      super ctx
      @

    login: ->
      { ctx } = @
  
      ctx.body = await ctx.service.user.login ctx.request.body

    create: ->
      { ctx } = @

      ctx.body = await ctx.service.user.create ctx.request.body
           
    fetch: ->
      { ctx } = @
      
      ctx.body = await ctx.service.user.fetch ctx.request.body
      
    patch: ->
      { ctx } = @
      
      ctx.body = await ctx.service.user.patch ctx.request.body
      
    reload: ->
      { ctx } = @

      ctx.body = await ctx.service.user.reload ctx.request.body

    remove: ->
      { ctx } = @

      ctx.body = await ctx.service.user.remove ctx.request.body
        
  return UsersController