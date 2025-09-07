#!/bin/bash

declare -a lambdas=( "a" "b" "c" "d" "e" )

for i in "${lambdas[@]}"
do
    aws lambda update-function-configuration --function-name "$i" --no-cli-pager --runtime nodejs14.x --profile testaccount
done

