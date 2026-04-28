#!/bin/bash

set -e

REGION="us-east-1"

echo "🔥 Searching eksctl stacks in $REGION ..."

STACKS=$(aws cloudformation list-stacks \
  --region $REGION \
  --stack-status-filter CREATE_IN_PROGRESS CREATE_FAILED DELETE_FAILED UPDATE_ROLLBACK_FAILED UPDATE_ROLLBACK_COMPLETE \
  --query "StackSummaries[?contains(StackName, 'eksctl')].StackName" \
  --output text)

if [ -z "$STACKS" ]; then
  echo "✅ No eksctl stacks found. Nothing to delete."
  exit 0
fi

echo "🧹 Found stacks:"
echo "$STACKS"

for stack in $STACKS; do
  echo "❌ Deleting stack: $stack"
  aws cloudformation delete-stack \
    --stack-name "$stack" \
    --region $REGION || true
done

echo "⏳ Waiting for stacks to delete (this may take 10–20 mins)..."

for stack in $STACKS; do
  echo "⏳ Waiting for $stack ..."
  aws cloudformation wait stack-delete-complete \
    --stack-name "$stack" \
    --region $REGION || true
done

echo "🔍 Final verification..."

REMAINING=$(aws cloudformation list-stacks \
  --region $REGION \
  --stack-status-filter CREATE_IN_PROGRESS CREATE_FAILED DELETE_FAILED UPDATE_ROLLBACK_FAILED UPDATE_ROLLBACK_COMPLETE \
  --query "StackSummaries[?contains(StackName, 'eksctl')].StackName" \
  --output text)

if [ -z "$REMAINING" ]; then
  echo "🎉 CLEANUP COMPLETE — All EKS stacks removed!"
else
  echo "⚠️ Some stacks still remain:"
  echo "$REMAINING"
fi