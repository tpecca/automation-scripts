#!/bin/bash

declare env="testaccount"
declare -a buckets=( "import-files" "user-uploads" "reports" "resources" )

for i in "${buckets[@]}"
do
    aws s3 rm "s3://product-$env-$i" --recursive --profile "$env"
done

declare profile="default"
aws s3 rm "s3://$env.product.cloud" --recursive --profile "$profile"

./delete-s3-versions.py "$env" "product-$env-import-files"