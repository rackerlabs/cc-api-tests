# API Tests for Cloud Controller API
## Description
Concourse Pipelines that comprehensively test the [Cloud Controller API](http://apidocs.cloudfoundry.org/280/).
## Usage

The following params must be available either in a params file, Vault,
or CredHub for each pipeline.

```
CF_API_URL:
LOGIN_URL:
CLIENT_ID: Used for generating the auth token
PASSWORD: uaac user password (url encoded) (see Requirements)
USERNAME: uaac user (see Requirements)
BUCKET: Used for storing temporary values during the test
CC_API_TEST_ACCESS_KEY: Used for accessing the bucket
CC_API_TEST_SECRET_ACCESS_KEY: Used for accessing the bucket
FOUNDATION:
DATADOG_API_KEY: Optional
```

## Requirements
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
### S3 Bucket
1. Create a bucket in an S3-compatible blob store.
2. Create an IAM user that has access to write to the bucket.
3. Update params with the bucket name and access credentials.