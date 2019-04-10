# Network License Manager for MATLAB on Amazon Web Services

# Requirements

Before starting, you will need the following:

- An Amazon Web Services™ (AWS) account with required permissions. To see what is required, look at the [example policy](/doc/example-iam-policy.json).

- An SSH Key Pair for your AWS account in your chosen region (see [Templates for All Supported MATLAB Versions and AWS Regions](#templates-for-all-supported-matlab-versions-and-aws-regions) for supported regions, examples use `us-east-1`). Create an SSH key pair if you do not already have one. For instructions [see the AWS documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html).

# Costs
You are responsible for the cost of the AWS services used when you create cloud resources using this guide. Resource settings, such as instance type, will affect the cost of deployment. For cost estimates, see the pricing pages for each AWS service you will be using. Prices are subject to change.

# Introduction
The following guide will help you automate the process of launching a network license manager for MATLAB on Amazon EC2 resources in your AWS account. For information about the architecture of this solution, see [Learn About Network License Manager for MATLAB Architecture](#learn-about-network-license-manager-for-matlab-architecture).

## Note
If you experience problems when deploying a previously downloaded version of this reference architecture template, use the Launch Stack button below to deploy the latest version.

# Deployment Steps

## Step 1. Launch the Template

Click the **Launch Stack** button below to deploy the cloud resources on AWS. This will open the AWS console in your web browser.

[![alt text](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png "Start a network license manager for MATLAB using the template")](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/network-license-manager-for-matlab-on-aws/Network-License-Manager-Template-R2019a_us-east-1.json)

> Platform: "Ubuntu 18.04 LTS"

> Network license manager for MATLAB Release: R2019a

> Region: us-east-1

For other releases or regions, see [Templates for All Supported MATLAB Versions and AWS Regions](#templates-for-all-supported-matlab-versions-and-aws-regions)

## Step 2. Configure the Cloud Resources
After you click the Launch Stack button above, the “Create stack” page will open in your browser where you can configure the parameters. It is easier to complete the steps if you position these instructions and the AWS console window side by side.

1. Specify and check the defaults for these resource parameters:

    | Parameter label                                    | Description
    | -------------------------------------------------- | -----------
    | **Stack name**                                     | Choose a name for the stack. This will be shown in the AWS console.
    | **Instance type for the network license manager**  | Choose the AWS instance type to use for the license sever. All [AWS instance types](https://aws.amazon.com/ec2/instance-types) are supported.
    | **Name of SSH key**                                | Choose the name of an existing EC2 KeyPair to allow SSH access to the license server instance. If you do not have one, [follow the AWS instructions to create one.](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
    | **CIDR IP address range of client**                | This is the IP address range that will be allowed to connect to this instance using SSH. The format for this field is IP Address/Mask. <p><em>Example</em>: </p>10.0.0.1/32 <ul><li>This is the public IP address which can be found by searching for "what is my ip address" on the web. The mask determines the number of IP addresses to include.</li><li>A mask of 32 is a single IP address.</li><li>Use a [CIDR calculator](https://www.ipaddressguide.com/cidr) if you need a range of more than one IP addresses.</li><li>You may need to contact your IT administrator to determine which address is appropriate.</li></ul></p>
    | **Username**					                     | Enter a username you would like to use to connect to the network license manager for MATLAB Dashboard.
    | **Password**					                     | Enter a password you would like to use to connect to the network license manager for MATLAB Dashboard.
	| **Confirm Password**			                     | Retype the password to confirm.

2. Click the **Create** button.

When you click Create, the license server is created using AWS CloudFormation templates.

# Step 3: Connect to the Dashboard
> **Note**: The Internet Explorer web browser is not supported for interacting with the cloud console.

1. In the Stack Detail for your stack, expand the **Outputs** section.
2. Look for the key named `ServerAddress` and click the corresponding URL listed under value. This is the HTTPS endpoint to the network license manager for MATLAB Dashboard.

# Step 4: Log in to the Dashboard

1. Enter the username and password you created in Step 2.

> **Note**: The dashboard uses a self-signed certificate which can be changed. For information on changing the self-signed certificates, see [Change Self-signed Certificate](#change-self-signed-certificate).

# Step 5: Upload the License File
> **Note**: You will need the fixed MAC address created in the CloudFormation Stack to get a license file from the MathWorks License Center for your product. For more information see the documentation for your product.

1. In the cloud console, go to **Administration > Manage License**.
2. Click **Browse License File** to select the license file you want to upload and click **Open**.
3. Click **Upload**.

You are now ready to use the network license manager on AWS.

To configure your MATLAB products deployed in AWS to use the network license manager see the product documentation. An example for MATLAB Parallel Server can be found at [MATLAB Parallel Server on Amazon Web Services](https://github.com/mathworks-ref-arch/matlab-parallel-server-on-aws).

# Additional Information
## Delete Your Cloud Resources
You can remove the CloudFormation stack and all associated resources when you are done with them. Note that you cannot recover resources once they are deleted. After you delete the cloud resources you cannot use the downloaded profile again.

1. Select the Stack in the CloudFormation Stacks screen.  Select **Actions/Delete**.

     ![CloudFormation Stacks Output](/doc/cloudformation-delete-stack.png)

2. Confirm the delete when prompted.  CloudFormation will now delete your resources which can take a few minutes.

## Change Self-signed Certificate
You can change the self-signed certificate used to connect to the dashboard. To upload an HTTPS certificate:
1. On the dashboard navigation menu, select **Administration** > **Manage HTTPS Certificate**.
1. Click **Browse Certificate...** and select a certificate file. Only `.pfx` files are supported.
1. Enter the certificate password in the **Certificate Password** field.
1. Click **Upload**.

The server will automatically restart after uploading a certificate. You will need to sign out and sign back in.

## Troubleshooting
If your stack fails to create, check the events section of the CloudFormation console. It will indicate which resources caused the failure and why.

If the stack created successfully but you are unable to access the dashboard check the logs on the instances to diagnose the error. The logs are output to /var/log on the instance nodes; the files of interest are cloud-init.log, cloud-init-output.log, mathworks.log.

## Use Existing VPC
You can launch the reference architecture within an existing VPC and subnet using the Network-License-Manager-Template-existing-vpc.json template.

[![alt text](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png "Start a network license manager using the template")](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/network-license-manager-for-matlab-on-aws/Network-License-Manager-Template-existing-vpc-R2019a_us-east-1.json)

> Platform: "Ubuntu 18.04 LTS"

> Network license manager for MATLAB Release: R2019a

> Region: us-east-1

For other releases or regions, see [Templates for All Supported MATLAB Versions and AWS Regions](#templates-for-all-supported-matlab-versions-and-aws-regions)

This template requires the following additional parameters:

| Parameter label | Description |
| --- | --- |
| **VPC** (required) | The ID of an existing Virtual Private Cloud to deploy this stack in |
| **Subnet** (required) | The ID of an existing subnet for the license server |
| **CIDR IP address range for the VPC** (required) | Specify the IP address range for the VPC to allow other MathWorks products deployed in this VPC to access this network license manager. This must be a valid IP CIDR range of the form x.x.x.x/x.

## Learn About Network License Manager for MATLAB Architecture

![Cluster Architecture](/doc/network-license-manager-architecture.png?raw=true)

*Figure 2: Network License Manager Architecture*

### Networking resources
* VPC (AWS::EC2::VPC): The Amazon Virtual Private Cloud used by the cluster. Note that by default Amazon limits the number of VPCs you can create per region to 5. You can apply to increase this limit if you want to start several clusters simultaneously. The VPC includes the following components:
  * VPC Gateway Attachment (AWS::EC2::VPCGatewayAttachment)
  * Subnet (AWS::EC2::Subnet)
  * Route (AWS::EC2::Route)
  * RouteTable (AWS::EC2::RouteTable)
  * Internet Gateway (AWS::EC2::InternetGateway)
  * Subnet Route Table Association (AWS::EC2::SubnetRouteTableAssociation)
* Security Group (AWS::EC2::SecurityGroup): The security group defines the ports that are opened for ingress to the cluster:
  * 22: Required for SSH access to the cluster nodes.
  * 443: Required for HTTPS access to the dashboard.
  * 27000-27001: Required for communication from MATLAB and MATLAB workers to the network license manager for MATLAB.
* Internal Security Group Traffic Rule (AWS::EC2::SecurityGroupIngress): Opens access to network traffic between all instances internally.
* Elastic IP: An elastic IP is created so that the server can be restarted and keep the same IP and MAC address to ensure the license file downloaded from MathWorks remains valid.

### Instances
* Network license manager instance (AWS::EC2::Instance): An EC2 instance for the license server.

## Templates for All Supported MATLAB Versions and AWS Regions

To deploy a template, select a MATLAB version (e.g., R2019a), the template type (e.g., Network-License-Manager-Template-existing-vpc) and the AWS region into which you will be deploying (e.g., eu-west-1) from the following table. To use an existing VPC, select the template type with the -existing-vpc suffix. Launch the selected template using the launch button.

As of R2019a, this reference architecture supports the eu-west-1 AWS region in addition to us-east-1.

 | Release | Region | Template | Base Operating System | Launch |
 | ------- | ------ | -------- | --------------------- | ------ |
 | MATLAB R2019a | us-east-1 | Network-License-Manager-Template | Ubuntu 18.04 LTS | [![alt text](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png "Start a cluster using the template")](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/network-license-manager-for-matlab-on-aws/Network-License-Manager-Template-R2019a_us-east-1.json) |
 | MATLAB R2019a | us-east-1 | Network-License-Manager-Template-existing-vpc | Ubuntu 18.04 LTS | [![alt text](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png "Start a cluster using the template")](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/network-license-manager-for-matlab-on-aws/Network-License-Manager-Template-existing-vpc-R2019a_us-east-1.json) |
 | MATLAB R2019a | eu-west-1 | Network-License-Manager-Template | Ubuntu 18.04 LTS | [![alt text](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png "Start a cluster using the template")](https://eu-west-1.console.aws.amazon.com/cloudformation/home?region=eu-west-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/network-license-manager-for-matlab-on-aws/Network-License-Manager-Template-R2019a_eu-west-1.json) |
 | MATLAB R2019a | eu-west-1 | Network-License-Manager-Template-existing-vpc | Ubuntu 18.04 LTS | [![alt text](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png "Start a cluster using the template")](https://eu-west-1.console.aws.amazon.com/cloudformation/home?region=eu-west-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/network-license-manager-for-matlab-on-aws/Network-License-Manager-Template-existing-vpc-R2019a_eu-west-1.json) |
 | MATLAB R2018b | us-east-1 | Network-License-Manager-Template | Ubuntu 16.04 LTS | [![alt text](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png "Start a cluster using the template")](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/network-license-manager-for-matlab-on-aws/Network-License-Manager-Template-R2018b_us-east-1.json) |
 | MATLAB R2018b | us-east-1 | Network-License-Manager-Template-existing-vpc | Ubuntu 16.04 LTS | [![alt text](https://s3.amazonaws.com/cloudformation-examples/cloudformation-launch-stack.png "Start a cluster using the template")](https://us-east-1.console.aws.amazon.com/cloudformation/home?region=us-east-1#/stacks/create/review?templateURL=https://s3.amazonaws.com/network-license-manager-for-matlab-on-aws/Network-License-Manager-Template-existing-vpc-R2018b_us-east-1.json) |

# Enhancement Request
Provide suggestions for additional features or capabilities using the following link: [https://www.mathworks.com/cloud/enhancement-request.html](https://www.mathworks.com/cloud/enhancement-request.html)

# Technical Support
Email: `cloud-support@mathworks.com`
