# Network License Manager for MATLAB on Amazon Web Services (Linux VM)

# Requirements

Before starting, you need:

- An Amazon Web Services™ (AWS) account with required permissions. To see what is required, look at the [example policy](example-iam-policy.json).

- An SSH Key Pair for your AWS account in your chosen region. Create an SSH key pair if you do not already have one. For instructions [see the AWS documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).

- A valid MathWorks™ license. For more information on how to configure your license for cloud use, see [Confirm Licensing for MathWorks Products Running on the Cloud](https://mathworks.com/help/install/license/licensing-for-mathworks-products-running-on-the-cloud.html).

- To be an administrator of the network license that you want to use.

# Costs
You are responsible for the cost of the AWS services used when you create cloud resources using this guide. Resource settings, such as instance type, will affect the cost of deployment. For cost estimates, see the pricing pages for each AWS service you will be using. Prices are subject to change.

# Introduction
The following guide will help you automate the process of launching a network license manager for MATLAB, running on a Linux virtual machine, on Amazon EC2 resources in your AWS account. For information about the architecture of this solution, see [Learn About Network License Manager for MATLAB Architecture](#learn-about-network-license-manager-for-matlab-architecture).

## Note
If you experience problems when deploying a previously downloaded version of this reference architecture template, try using the latest version from this repository instead.

# Deployment Steps

To view instructions for deploying the Network License Manager for MATLAB reference architecture, select a MATLAB release:

| Release |
| ------- |
| [R2021b](releases/R2021b/README.md) |
| [R2021a](releases/R2021a/README.md) |
| [R2020b](releases/R2020b/README.md) |
| [R2020a](releases/R2020a/README.md) |
| [R2019b](releases/R2019b/README.md) |
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

## FAQ
### How do I copy the VM image to a different region?
You can copy the AMI for a certain MATLAB version to a target region of your choice.

* In the Releases folder of this repository, choose the MATLAB release that you want to copy. Download and open the CloudFormation template .json file for that release.
* Locate the Mappings section in the CloudFormation template. Copy the AMI ID for one of the existing regions, for example, us-east-1.
* To copy the AMI to your target region, follow the instructions at Copying an AMI on the AWS documentation.
* In the Mappings section of the CloudFormation template, add a new RegionMap pair corresponding to your target region. Insert the new AMI ID of the AMI in the target region.
* In your AWS Console, change your region to your target region. In the CloudFormation menu, select Create Stack > With new resources option. Provide the modified CloudFormation template.

You can now deploy the AMI in your target region using the AMI that you copied.

# Technical Support
If you require assistance or have a request for additional features or capabilities, please contact [MathWorks Technical Support](https://www.mathworks.com/support/contact_us.html).