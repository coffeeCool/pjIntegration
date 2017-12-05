# 公共的一些配置信息
exports.source =
  leanCloud:
    classBaseUri: 'https://xy1g1vfw.api.lncld.net/1.1/classes'
    userBaseUri: 'https://xy1g1vfw.api.lncld.net/1.1'
    headers: 
      'Content-Type': 'application/json'
      'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz' 
      'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
    master_headers:
      'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
      'X-LC-Key': 'eQYsxL68rSQLFyxiPtgxN4wW,master'
    className: 'Todos'
  
  localhost:
    uri: 'http://192.168.0.192:7001'
  
  wechat: 
    token: 'wechatTest'
    grant_type: 'client_credential'
    appId: 'wx58236c27c50e1ff5'
    appSecret: 'a690de701dd2418261808f8b5f3354b1'

  
