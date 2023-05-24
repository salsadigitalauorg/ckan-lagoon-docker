# docker_ckan
A place to store base ckan docker images


Next we need a bake config that defines configuration, targets, platforms. Example for a single image a file named bake.hcl:
```
group "default" {
    targets = ["cli"]
}

target "cli" {
    dockerfile = "Images/CKAN/2.9/Dockerfile.ckan"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["salsadigitalau/ckan-2.9:2.9.5"]
}
```
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