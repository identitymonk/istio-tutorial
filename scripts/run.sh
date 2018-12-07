#!/bin/bash
QUERY=$(oc get virtualservice/customer -o jsonpath='{.spec.http[0].match[0].uri.exact}')
GATEWAY_URL="http://$(oc get route istio-ingressgateway -n istio-system --template='{{ .spec.host }}')$QUERY"

while true
do curl $GATEWAY_URL
sleep .2
done
