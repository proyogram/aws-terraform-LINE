import json
import boto3
import push_msg_line

def lambda_handler(event, context):
    result_msg = ""
    client = boto3.client('ec2')
    running_instances = client.describe_instances(
      Filters=[
        {
          'Name': 'instance-state-name',
          'Values': ['running']
        }
      ]
    )
    
    for reservation in running_instances['Reservations']:
      for instance in reservation['Instances']:
        instance_id = instance.get('InstanceId')
        result_msg += f"{instance_id} is active!\n"
        
        
    if result_msg == "":
      result_msg = "None Active Instances this week!"
      push_msg_line.main(result_msg)
      
    else:
      push_msg_line.main(result_msg)
    
        
        
    