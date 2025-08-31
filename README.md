# Cloud Resume Challenge

**Demo:** [Ewubare.com](https://ewubare.com)

## Project Overview
This project combines a static resume site with a serverless API to track visitors. When someone visits my resume, JavaScript calls an API that increments a counter stored in DynamoDB and displays the current count.

## Architecture
- Frontend: Route 53 -> CloudFront -> S3
- Backend: JavaScript -> API Gateway -> Lambda -> DynamoDB
  

## AWS Infrastructure Setup
- **S3 Bucket** - Create bucket for static hosting with public read access.
- **CloudFront Distribution** - Necessary for HTTPS since S3 static hosting only supports HTTP.
- **DynamoDB Table** - I used a simple partition key setup since I only need to store one counter value. On-demand billing made sense because the traffic is low and unpredictable.
- **Lambda Function** - Deploy Python function with DynamoDB permissions.
- **API Gateway** - See CORS configuration
- **Route 53** - I already owned the domain through Namecheap, so I had to update the nameservers to point to Route 53's.

## Security Implementations
- **HTTPS Enforcement** - Without this, anyone could intercept the visitor data or inject malicious code. CloudFront handles the SSL certificate automatically, so there's no reason not to encrypt everything.
- **IAM Least Privilege** - My Lambda function only needs to read/write one DynamoDB table. Giving it broader permissions would be unnecessary risk - if someone compromised the function, they couldn't access other AWS resources.
- **CORS Configuration** - Browsers block cross-origin requests by default for security. I had to explicitly allow my domain to call the API, but I didn't use a wildcard that would let any website make requests.
- **API Rate Limiting** - Built-in AWS API Gateway throttling

## Performance Optimizations
- **Static Site Generation** - The resume content doesn't change often, so pre-building HTML files means faster loading than dynamically generating pages. Plus it works well with CDN caching.
- **CDN Distribution** - CloudFront caches my static files globally, so visitors in other parts of the world get faster load times than if everything came from a single S3 region.
- **Serverless Architecture** - Lambda only runs when someone hits the API, so I'm not paying for idle server time. It also scales automatically if traffic spikes without me managing anything.
- **Database Optimization** - For a simple visitor counter with low traffic, paying per request makes more sense than provisioning dedicated capacity that would sit mostly unused.


| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/visitor-count` | Increments and returns current visitor count |

**Example Response:**
```json
{
  "statusCode": 200,
  "body": "{\"count\": 42}"
}
```

## Security Implementations

- **HTTPS Enforcement** - Without this, anyone could intercept the visitor data or inject malicious code. CloudFront handles the SSL certificate automatically, so there's no reason not to encrypt everything.
- **IAM Least Privilege** - My Lambda function only needs to read/write one DynamoDB table. Giving it broader permissions would be unnecessary risk - if someone compromised the function, they couldn't access other AWS resources.
- **CORS Configuration** - Browsers block cross-origin requests by default for security. I had to explicitly allow my domain to call the API, but I didn't use a wildcard that would let any website make requests.
- **API Rate Limiting** - Built-in AWS API Gateway throttling

## Performance Optimizations

- **Static Site Generation** - The resume content doesn't change often, so pre-building HTML files means faster loading than dynamically generating pages. Plus it works well with CDN caching.
- **CDN Distribution** - CloudFront caches my static files globally, so visitors in other parts of the world get faster load times than if everything came from a single S3 region.
- **Serverless Architecture** - Lambda only runs when someone hits the API, so I'm not paying for idle server time. It also scales automatically if traffic spikes without me managing anything.
- **Database Optimization** - For a simple visitor counter with low traffic, paying per request makes more sense than provisioning dedicated capacity that would sit mostly unused.

The visitor counter has tracked over 25 visits so far, which means either people are checking out my resume or I've been testing it too much.
---

