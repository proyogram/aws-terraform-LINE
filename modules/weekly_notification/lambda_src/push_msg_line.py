import urllib.request
import json
import os
import boto3

def fetch_secret_value(ENV_VAR_KEY):
    secret_id_key = os.environ[ENV_VAR_KEY]
    client = boto3.client('secretsmanager')
    access_token_object = client.get_secret_value(
        SecretId=secret_id_key
    )
    access_token=access_token_object['SecretString']
    access_token=json.loads(access_token)[secret_id_key]
    return access_token

def main(push_message):
    user_id =  fetch_secret_value("USER_ID_KEY")
    access_token = fetch_secret_value("ACCESS_TOKEN_KEY")

    if push_message == "":
        print("YOU CANNOT PUSH EMPTY MESSAGE!!")
    else:
        # lineにpushするメソッド(API GW)を呼び出し。
        url = 'https://api.line.me/v2/bot/message/push'
        
        message_body = {
            "to": user_id,
    	    "messages":[{"type" : "text","text" : push_message}]
        }
        message_body_json = json.dumps(message_body).encode()
        
        headers = {
            'Content-Type' : 'application/json',
    	    'Authorization' : 'Bearer {' + access_token + '}',
        }
        
        # 以上の情報をRequestを用いてPush
        req = urllib.request.Request(url, message_body_json, headers)
        urllib.request.urlopen(req)
    
