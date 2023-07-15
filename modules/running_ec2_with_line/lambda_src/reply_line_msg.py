import urllib.request
import json
import os
import boto3

def fetch_line_access_token():
    secret_id = os.environ["SECRET_ID_KEY"]
    client = boto3.client('secretsmanager')
    access_token_object = client.get_secret_value(
        SecretId=secret_id
    )
    access_token=access_token_object['SecretString']
    access_token=json.loads(access_token)[secret_id]
    return access_token

def main(reply_token, reply_message):
    access_token = fetch_line_access_token()
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
    
