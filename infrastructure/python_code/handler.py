import os
import json
import urllib.parse
import boto3

print('Loading function')

s3 = boto3.client('s3')


def lambda_handler(event, context):
    #print("Received event: " + json.dumps(event, indent=2))

    # Get the object from the event and show its content type
    bucket = event['Records'][0]['s3']['bucket']['name']
    event_date = event['Records'][0]['eventTime']
    etag = event['Records'][0]['s3']['object']['eTag']
    key = urllib.parse.unquote_plus(
        event['Records'][0]['s3']['object']['key'], encoding='utf-8')
    try:
        response = s3.get_object(Bucket=bucket, Key=key)
        print("CONTENT TYPE: " + response['ContentType'])
        ##### connection to dynamodb
        dynamodb = boto3.resource('dynamodb')

        ## selecting table
        table = dynamodb.Table(os.environ.get('DYNAMO_TABLE'))
        table.put_item(
            Item={
                'ID': etag,
                'name': key,
                'type': response['ContentType'],
                'date': event_date
               }
            )

        return response['ContentType']
    except Exception as e:
        print(e)
        print('Error getting object {} from bucket {}. Make sure they exist and your bucket is in the same region as this function.'.format(key, bucket))
        raise e
