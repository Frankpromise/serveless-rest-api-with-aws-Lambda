import boto3

def lambda_handler(event, context):
    session = boto3.Session(region_name="us-west-2")
    dynamodb = session.resource('dynamodb')
    table = dynamodb.Table('Pets')
    response = table.put_item(
        Item={
            'id': event['id'],
            'name': event['name'],
            'breed': event['breed'],
            'gender': event['gender'],
            'owner': event['owner'],
            'birthday': event['birthday']
        }
    )
    return {
        'statusCode': response['ResponseMetadata']['HTTPStatusCode'],
        'body': 'Record ' + event['id'] + ' Added'
    }