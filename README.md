# ckan_docker
A place to store base ckan docker images


Next we need a bake config that defines configuration, targets, platforms. Example for a single image a file named bake.hcl:
```
group "default" {
    targets = ["ckan"]
}

target "ckan" {
    dockerfile = "Images/CKAN/2.10/Dockerfile.ckan"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["salsadigitalau/ckan-2.10:2.10.1"]
}
```

# Store docker images in Github Container Registry
### https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry
## Create a Github Personal token with access to write packages
### https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-with-a-personal-access-token-classic
## Save your personal access token 
```export CR_PAT=YOUR_TOKEN```
## Test token
```
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
   > Login Succeeded
```
## Create, build, push images Github Container Registry
docker buildx create --name ckan-2.10 --platform linux/amd64,linux/arm64  
docker buildx bake -f ckan-2.10-bake.hcl --builder ckan-2.10 --push

docker buildx create --name ckan-2.9 --platform linux/amd64,linux/arm64  
docker buildx bake -f ckan-2.9-bake.hcl --builder ckan-2.9 --push

docker buildx create --name ckan-2.8 --platform linux/amd64,linux/arm64  
docker buildx bake -f ckan-2.8-bake.hcl --builder ckan-2.8 --push

docker buildx create --name solr-2.9 --platform linux/amd64,linux/arm64  
docker buildx bake -f solr-8-bake.hcl --builder solr-2.9 --push

docker buildx create --name solr-2.8 --platform linux/amd64,linux/arm64  
docker buildx bake -f solr-6-bake.hcl --builder solr-2.8 --push

docker buildx create --name postgis --platform linux/amd64,linux/arm64  
docker buildx bake -f postgis-bake.hcl --builder postgis --push