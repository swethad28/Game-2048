## Prerequisites needed for the project
# Install the following tools before starting
# kubectl, eksctl, aws cli, helm

## Create an EKS cluster using Fargate
eksctl create cluster --name demo-cluster --region us-east-1 --fargate

## Configure kubectl to connect to your EKS cluster
aws eks update-kubeconfig --name demo-cluster --region us-east-1

## Create a Fargate profile for the namespace
eksctl create fargateprofile \
  --cluster demo-cluster \
  --region us-east-1 \
  --name alb-sample-app \
  --namespace game-2048

## Deploy the 2048 game and necessary Kubernetes resources
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/examples/2048/2048_full.yaml
kubectl get pods -n game-2048
kubectl get svc -n game-2048
kubectl get ingress -n game-2048

## Check and associate IAM OIDC provider if not already done
eksctl utils associate-iam-oidc-provider --cluster demo-cluster --approve

## Download the IAM policy for the AWS Load Balancer Controller
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.11.0/docs/install/iam_policy.json

## Create IAM Policy for the ALB Ingress Controller
aws iam create-policy \
  --policy-name AWSLoadBalancerControllerIAMPolicy \
  --policy-document file://iam_policy.json

## Create IAM Role and attach the policy
eksctl create iamserviceaccount \
  --cluster=demo-cluster \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::961341544468:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve

## Add the AWS EKS Helm charts repository
helm repo add eks https://aws.github.io/eks-charts

## Update the Helm repository
helm repo update eks

## Install the AWS Load Balancer Controller using Helm
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  --namespace kube-system \
  --set clusterName=demo-cluster \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=us-east-1 \
  --set vpcId=<your-vpc-id>

## Verify the deployment and ingress
kubectl get deployment -n kube-system aws-load-balancer-controller
kubectl get pods -n kube-system
kubectl get deploy -n kube-system
kubectl get ingress -n game-2048

## Delete the EKS cluster when done
eksctl delete cluster --name demo-cluster --region us-east-1
