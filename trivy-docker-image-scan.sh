#!/bin/bash

dockerImageName="siddharth67/numeric-app:$GIT_COMMIT"
echo $dockerImageName

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy:0.52.0 -q image --exit-code 0 --severity HIGH --light $dockerImageName
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy:0.52.0 -q image --exit-code 1 --severity CRITICAL --light $dockerImageName

    # Trivy scan result processing
    exit_code=$?
    echo "Exit Code : $exit_code"

    # Check scan results
    if [[ "${exit_code}" == 1 ]]; then
        echo "Image scanning failed. Vulnerabilities found"
        exit 1;
    else
        echo "Image scanning passed. No CRITICAL vulnerabilities found"
    fi; 