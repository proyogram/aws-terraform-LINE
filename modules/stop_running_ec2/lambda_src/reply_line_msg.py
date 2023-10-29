import urllib.request
import json
import os

def main(reply_token, reply_message):
    access_token = os.environ["LINE_ACCESS_TOKEN"]
    # lineにreplyするメソッドを呼び出し。
    url = 'https://api.line.me/v2/bot/message/reply'
    
    message_body = [{"type" : "text","text" : reply_message}]
    
    request_headers = {
        'Authorization': 'Bearer ' + access_token, 
        'Content-Type': 'application/json'
    }
    
    params = {'replyToken' : reply_token, 'messages': message_body}
    
    req = urllib.request.Request(url, json.dumps(params).encode('utf-8'), method="POST", headers=request_headers)
    res = urllib.request.urlopen(req, timeout=10)
    
