import json
import urllib.request
import os
import boto3


def main(push_message):
    user_id =  os.environ["USER_ID_KEY"]
    access_token = os.environ["ACCESS_TOKEN_KEY"]

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


def lambda_handler(event, context):
    msg = event["Records"][0]["Sns"]["Message"]
    main(msg)
