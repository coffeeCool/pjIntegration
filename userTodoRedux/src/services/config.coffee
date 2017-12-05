export default config = do ->
  header = 
    todos: do() ->
      base = 
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      {
        base
      }
    
  baseUri =
    lc_uri: "https://xy1g1vfw.api.lncld.net/1.1"
    local_uri: "http://192.168.0.192:7001"
  
  users = 
    create:
      headers: header.todos.base
      uri:
        lc: ->
          "#{baseUri.lc_uri}/users?fetchWhenSave=true"
        local: ->
          "#{baseUri.local_uri}/users"
      method: 'POST'

    login:
      headers: header.todos.base
      uri:
        lc: ->
          "#{baseUri.lc_uri}/login"
        local: ->
          "#{baseUri.local_uri}/login"
      method: 'POST'

    fetch:
      headers: header.todos.base
      uri:
        lc: (data) ->
          "#{baseUri.lc_uri}/users/#{data.objectId}"
        local: (data) ->
          "#{baseUri.local_uri}/users/#{data.objectId}"
      method: 'GET'
    
    patch:
      headers: (data) ->
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
        'X-LC-Session': "#{data.sessionToken}"
      uri:
        lc: (data) ->
          "#{baseUri.lc_uri}/users/#{data.objectId}?fetchWhenSave=true"
        local: (data) ->
          "#{baseUri.local_uri}/users/#{data.objectId}"
      method: 'PUT'
    
    reload:
      headers: header.todos.base
      uri:
        lc: ->
          "#{baseUri.lc_uri}/users"
        local: ->
          "#{baseUri.local_uri}/users"
      method: 'GET'
    
    remove:
      headers: (data) ->
        'Content-Type': 'application/json'
        'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
        'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
        'X-LC-Session': "#{data.sessionToken}"
      uri:
        lc: (data) ->
          "#{baseUri.lc_uri}/users/#{data.objectId}"
        local: (data) ->
          "#{baseUri.local_uri}/users/#{data.objectId}"
      method: 'DELETE'
    
  # leancloud
  lc:
    todos:
      create:
        uri: users.create.uri.lc
        headers: users.create.headers
        method: users.create.method
      
      login:
        uri: users.login.uri.lc
        headers: users.login.headers
        method: users.login.method

      fetch:
        uri: users.fetch.uri.lc
        headers: users.fetch.headers
        method: users.fetch.method
      
      patch:
        uri: users.patch.uri.lc
        headers: users.patch.headers
        method: users.patch.method
      
      reload:
        uri: users.reload.uri.lc
        headers: users.reload.headers
        method: users.reload.method
      
      remove:
        uri: users.remove.uri.lc
        headers: users.remove.headers
        method: users.remove.method
    
  # local
  local:
    todos:
      create:
        uri: users.create.uri.local
        headers: users.create.headers
        method: users.create.method
      
      login:
        uri: users.login.uri.local
        headers: users.fetch.headers
        method: users.login.method

      fetch:
        uri: users.fetch.uri.local
        headers: users.fetch.headers
        method: users.fetch.method
      
      patch:
        uri: users.patch.uri.local
        headers: users.patch.headers
        method: users.patch.method
      
      reload:
        uri: users.reload.uri.local
        headers: users.reload.headers
        method: users.reload.method
      
      remove:
        uri: users.remove.uri.local
        headers: users.remove.headers
        method: users.remove.method


