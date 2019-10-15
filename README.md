# Network License Manager for MATLAB on Amazon Web Services

# Requirements

Before starting, you will need the following:

- An Amazon Web Services™ (AWS) account with required permissions. To see what is required, look at the [example policy](example-iam-policy.json).

- An SSH Key Pair for your AWS account in your chosen region (see [Templates for All Supported MATLAB Versions and AWS Regions](#templates-for-all-supported-matlab-versions-and-aws-regions) for supported regions, examples use `us-east-1`). Create an SSH key pair if you do not already have one. For instructions [see the AWS documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).

# Costs
You are responsible for the cost of the AWS services used when you create cloud resources using this guide. Resource settings, such as instance type, will affect the cost of deployment. For cost estimates, see the pricing pages for each AWS service you will be using. Prices are subject to change.

# Introduction
The following guide will help you automate the process of launching a network license manager for MATLAB on Amazon EC2 resources in your AWS account. For information about the architecture of this solution, see [Learn About Network License Manager for MATLAB Architecture](#learn-about-network-license-manager-for-matlab-architecture).

## Note
If you experience problems when deploying a previously downloaded version of this reference architecture template, try using the latest version from this repository instead.

# Deployment Steps

The Network License Manager for MATLAB Reference Architecture is released in lockstep with the bi-annual MATLAB releases. Each reference architecture release has its own instructions as we continue to evolve it. Select a release to continue:

| Release |
| ------- |
| [R2019a\_and\_older](releases/R2019a_and_older/README.md) |


## Learn About Network License Manager for MATLAB Architecture

![Cluster Architecture](img/network-license-manager-architecture.png?raw=true)

### Networking resources
* Security Group (AWS::EC2::SecurityGroup): The security group defines the ports that are opened for ingress to the instance:
  * 22: Required for SSH access to the cluster nodes.
  * 443: Required for HTTPS access to the dashboard.
  * 27000-27001: Required for communication from MATLAB and MATLAB workers to the network license manager for MATLAB.
* Internal Security Group Traffic Rule (AWS::EC2::SecurityGroupIngress): Opens access to network traffic between all instances internally.
* Elastic IP: An elastic IP is created so that the server can be restarted and keep the same IP and MAC address to ensure the license file downloaded from MathWorks remains valid.

### Instances
* Network license manager instance (AWS::EC2::Instance): An EC2 instance for the license server.

# Enhancement Request
Provide suggestions for additional features or capabilities using the following link: [https://www.mathworks.com/cloud/enhancement-request.html](https://www.mathworks.com/cloud/enhancement-request.html)

# Technical Support
Email: `cloud-support@mathworks.com`
