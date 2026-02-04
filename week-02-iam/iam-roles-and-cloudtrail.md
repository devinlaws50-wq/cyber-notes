
# Week 2 — IAM Roles & CloudTrail

## IAM Users vs Roles

IAM users represent long-term identities for humans.  
IAM roles represent temporary, assumable identities intended for systems or delegated access.

Roles are preferred in AWS because they eliminate long-lived credentials and reduce blast radius.

## Why Roles Are Preferred in Cloud Security

- Temporary credentials via STS
- Explicit trust relationships
- Easier auditing and revocation
- Strong alignment with least privilege

In this lab, I avoided using root or permanent credentials and relied on role assumption.

## EC2ReadOnlyRole Overview

I created an IAM role named `EC2ReadOnlyRole` with scoped read-only permissions.

The role:
- Allowed limited EC2 visibility
- Explicitly denied IAM and write actions
- Required both a trust policy and `sts:AssumeRole` permission

## Observed Access Denials

While operating under the assumed role:
- IAM actions such as `iam:ListUsers` and `iam:ListRoles` were denied
- EC2 dashboards partially loaded but failed on actions like `DescribeInstances`
- CloudWatch and VPC-related calls failed due to missing permissions

These failures confirmed least privilege enforcement.

## CloudTrail Verification

CloudTrail recorded the role assumption event:
- Event name: `AssumeRole`
- Identity type: IAM user
- Role ARN: `EC2ReadOnlyRole`

This validated that role assumption and permission boundaries were functioning correctly.
