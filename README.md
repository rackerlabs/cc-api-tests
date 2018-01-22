# API Tests for Cloud Controller API
## Description
Concourse Pipelines that comprehensively test the [Cloud Controller API](http://apidocs.cloudfoundry.org/280/).

## Installation
### Test User
1. Create the user
```
uaac user add cc-api-tests -p "PASSWORD" --emails cc-api-tests@example.com`
```
2. Add the user to the required groups.
```
uaac member add scim.read cc-api-tests
uaac member add uaa.admin cc-api-tests
uaac member add cloud_controller.admin cc-api-tests
uaac member add scim.write cc-api-tests
uaac member add routing.router_groups.read cc-api-tests
```

Alternatively, you can run the
[bootstrap-cc-api-tests](pipelines/bootstrap-cc-api-tests/pipeline.yml)
pipeline which will configure the UAA user for you. Before running
this pipeline, set the following params:

```
GITHUB_PRIVATE_KEY: Required to avoid API limits when using the git resource
CF_UAA_URI: Your UAA login uri (domain name without "https://")
CF_UAA_ADMIN_CLIENT_SECRET: Admin secret for UAA
CC_API_TEST_USER_PASSWORD: Password you want to give to the cc-api-tests user
CC_API_TEST_USER_EMAIL: Email address to assign to the above user in UAA
```

### S3 Bucket
1. Create a bucket in an S3-compatible blob store.
2. Enable versioning on the bucket.
3. Create an IAM user with the below policy.
```
{
"Version": "2012-10-17",
"Statement": [
	      {
	      "Effect": "Allow",
	      "Action": [
			 "s3:ListBucket",
			 "s3:ListBucketVersions",
			 "s3:GetBucketVersioning"
			 ],
	      "Resource": ["arn:aws:s3:::BUCKETNAME"]
	      },
	      {
	      "Effect": "Allow",
	      "Action": [
			 "s3:PutObject",
			 "s3:PutObjectAcl",
			 "s3:GetObject",
			 "s3:DeleteObject",
			 "s3:GetObjectVersion",
			 "s3:PutObjectVersionAcl"
			 ],
	      "Resource": ["arn:aws:s3:::BUCKETNAME/*"]
	      }
	      ]
}

```
### Parameters
The following params must be available either in a params file, Vault,
or CredHub for each pipeline.

```
GITHUB_PRIVATE_KEY: Required to avoid API limits when using the git resource
CF_API_URL:
LOGIN_URL:
CLIENT_ID: Used for generating the auth token
PASSWORD: uaac user password (url encoded) (see Requirements)
USERNAME: uaac user (see Requirements)
BUCKET: Used for storing temporary values during the test
REGION: Region of the s3 bucket
CC_API_TEST_ACCESS_KEY: Used for accessing the bucket
CC_API_TEST_SECRET_ACCESS_KEY: Used for accessing the bucket
PIPELINE:
FOUNDATION:
DATADOG_API_KEY: Optional
```
