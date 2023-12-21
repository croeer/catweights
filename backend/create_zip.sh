#!/bin/bash
cd package
zip -r ../lambda_function.zip .
cd ..
zip catweights-api.zip *.py