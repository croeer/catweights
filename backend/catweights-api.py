import simplejson as json
import boto3

dynamodb = boto3.resource("dynamodb")
table_name = "catweights"  # Replace with your DynamoDB table name
table = dynamodb.Table(table_name)


def lambda_handler(event, context):
    try:
        response = table.scan()
        items = response.get("Items", [])

        return {"statusCode": 200, "body": json.dumps(items)}
    except Exception as e:
        print(f"Error: {e}")
        return {
            "statusCode": 500,
            "body": json.dumps({"message": "Internal Server Error"}),
        }
