# Network License Manager for MATLAB on Amazon Web Services (Linux VM)

This repository shows how to deploy a network license manager for MATLAB&reg;, MATLAB Parallel Server&reg;, and other Mathworks&reg; products, running on a Linux&reg; EC2&reg; instance in your AWS&reg; account. For information about the architecture of this solution, see [Learn about Architecture](#learn-about-architecture).


# Requirements

You need:

- An Amazon&reg; Web Services (AWS) account with required permissions. For details, see [Example IAM Policy](example-iam-policy.json).

- An SSH key pair for your AWS account in your chosen region. Create an SSH key pair if you do not already have one. For instructions, see the [AWS documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).

- A valid MATLAB license. For details, see [License Requirements for MATLAB on Cloud Platforms](https://www.mathworks.com/help/install/license/licensing-for-mathworks-products-running-on-the-cloud.html).

- Administrator status for the network license you want to use.

# Costs
You are responsible for the cost of the AWS services used when you create cloud resources using this guide. Resource settings, such as instance type, affect the cost of deployment. For cost estimates, see the pricing pages for each AWS service you will be using. Prices are subject to change.

# Deployment Steps

To view instructions for deploying the Network License Manager for MATLAB reference architecture, select a MATLAB release:

> [!IMPORTANT]  
> MathWorks recommends using the template for the [Latest](releases/v1/latest/README.md) release, which is also compatible with prior releases of MATLAB, MATLAB Parallel Server, and MATLAB Production Server. From September 2025, this will be the only template listed here.

| Release |
|---------|
| [Latest - Network License Manager](releases/v1/latest/README.md) |
| [R2025a](releases/R2025a/README.md) |
| [R2024b](releases/R2024b/README.md) |
| [R2024a](releases/R2024a/README.md) |
| [R2023b](releases/R2023b/README.md) |
| [R2023a](releases/R2023a/README.md) |
| [R2022b](releases/R2022b/README.md) |
| [R2022a](releases/R2022a/README.md) |
| [R2021b](releases/R2021b/README.md) |
| [R2021a](releases/R2021a/README.md) |
| [R2020b](releases/R2020b/README.md) |
| [R2020a](releases/R2020a/README.md) |
| [R2019b](releases/R2019b/README.md) |
| [R2019a\_and\_older](releases/R2019a_and_older/README.md) |


## Learn about Architecture

![Cluster Architecture](img/network-license-manager-architecture.png?raw=true)

### Networking Resources
* Security Group (AWS::EC2::SecurityGroup): The security group defines the ports that are opened to the instance:
  * 22: Required for SSH access to the cluster nodes.
  * 443: Required for HTTPS access to the dashboard.
  * 27000-27010: Required for communication from MATLAB and MATLAB workers to the network license manager for MATLAB.
* Internal Security Group Traffic Rule (AWS::EC2::SecurityGroupIngress): Opens access to network traffic between all instances internally.
* Elastic IP: An elastic IP is created so that the server can be restarted and keep the same IP and MAC address to ensure the license file downloaded from MathWorks remains valid.

### Instances
* Network license manager instance (AWS::EC2::Instance): An EC2 instance for the license server.

## FAQ
### How do I copy the VM image to a different region?
You can copy the AMI for a certain MATLAB version to a target region of your choice.

* In the Releases folder of this repository, choose the MATLAB release that you want to copy. Download and open the CloudFormation template .json file for that release.
* Locate the Mappings section in the CloudFormation template. Copy the AMI ID for one of the existing regions, for example, us-east-1.
* To copy the AMI to your target region, follow the steps in the [AWS documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/CopyingAMIs.html).
* In the Mappings section of the CloudFormation template, add a new RegionMap pair corresponding to your target region. Insert the new AMI ID of the AMI in the target region.
* In your AWS Console, change your region to your target region. In the CloudFormation menu, select the Create Stack > With new resources option. Provide the modified CloudFormation template.

You can now deploy the AMI in your target region using the AMI that you copied.

# Technical Support
To request assistance or additional features, contact [MathWorks Technical Support](https://www.mathworks.com/support/contact_us.html).

----

Copyright 2018-2025 The MathWorks, Inc.

----