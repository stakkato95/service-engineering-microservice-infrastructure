cd ../middle

# 1. do not install service, as it is already deployed
# 1. install virtual service and destination rules
mv helm/templates/service.yaml helm/templates/_service.yaml
mv helm/templates/_virtualservice.yaml helm/templates/virtualservice.yaml
mv helm/templates/_destinationrules.yaml helm/templates/destinationrules.yaml

helm upgrade middle-canary helm --set release.weight.old=10 --set release.weight.new=90 --set app.version="canary" --set app.oldVersion="stable" --set image.tag=canary

# rollback renamings
mv helm/templates/_service.yaml helm/templates/service.yaml
mv helm/templates/virtualservice.yaml helm/templates/_virtualservice.yaml
mv helm/templates/destinationrules.yaml helm/templates/_destinationrules.yaml

cd ../k8s