import json
import reply_line_msg
import boto3

def fetch_running_instances():
  running_instance_id_list  =[]
  ec2 = boto3.client('ec2')
  instances_data = ec2.describe_instances()
  for instances_reservations in instances_data['Reservations']:
    for instance in instances_reservations['Instances']:
      if instance['State']['Name'] == "running":
        running_instance_id_list.append(instance['InstanceId'])
  return running_instance_id_list
  
def stop_instance(instance_id):
  ec2 = boto3.client('ec2')
  response = ec2.stop_instances(InstanceIds=[instance_id])
    
def lambda_handler(event, context):
  stopping_instance_id_list = []
  reply_token = json.loads(event['body'])['events'][0]['replyToken']
  user_msg=json.loads(event['body'])['events'][0]['message']['text']
  running_instance_id_list = fetch_running_instances()
  for running_instance_id in running_instance_id_list:
    if  running_instance_id in user_msg and "stop" in user_msg.lower():
      stopping_instance_id_list.append(running_instance_id)
      
  if  "ids" in user_msg.lower():
    reply_msg = "<Running Instance Ids>"
    if len(running_instance_id_list)==0:
      reply_msg += "\n"+"nothing"
    for running_instance_id in running_instance_id_list:
      reply_msg += "\n" + running_instance_id
      
      
  elif stopping_instance_id_list != []:
    reply_msg = "Stopping the instances below!"
    for stopping_instance_id in stopping_instance_id_list:
      reply_msg += "\n" + stopping_instance_id
      stop_instance(stopping_instance_id)
      
      
  else:
    reply_msg = 'Push your message with two words, "<Running Instance Ids>" and "stop"!'
    reply_msg += "\n"+"<Running Instance Ids>"
    if len(running_instance_id_list)==0:
      reply_msg += "\n"+"nothing"
    for running_instance_id in running_instance_id_list:
      reply_msg += "\n" + running_instance_id
  
  reply_line_msg.main(reply_token, reply_msg)
