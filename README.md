# ckan-lagoon-docker
A place to store base ckan docker images for Lagoon projects


## Store docker images in Github Container Registry https://github.com/orgs/salsadigitalauorg/packages?repo_name=ckan-lagoon-docker
    https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry
### Create a Github Personal token with access to write packages
    https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-with-a-personal-access-token-classic

### Save your personal access token 
```export CR_PAT=YOUR_TOKEN```
#### Test token
```
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
   > Login Succeeded
```
### Create, build, push images Github Container Registry
#### Update the .env.bake file and set the CKAN and lagoon versions
    # CKAN Tags: https://github.com/ckan/ckan/tags
    CKAN_2_10_VERSION="2.10.3"
    CKAN_2_9_VERSION="2.9.10"
    # Lagoon Image Tags: https://github.com/uselagoon/lagoon-images/tags
    LAGOON_VERSION="23.12.0"
### CKAN 2.10
#### Build for testing locally
    docker build --pull --rm -f "Images/CKAN/2.10/Dockerfile.ckan" -t ghcr.io/salsadigitalauorg/ckan-2.10:2.10.3 "Images/    CKAN/2.10" --build-arg CKAN_VERSION="2.10.3" --build-arg LAGOON_VERSION="23.12.0"
#### Build and Push to ghcr
    docker buildx create --name ckan-2.10 --platform linux/amd64,linux/arm64 (Just the first time to create builder)
    docker buildx bake -f ckan-2.10-bake.hcl -f .env.bake --builder ckan-2.10 --push

### CKAN 2.9
#### Build for testing locally
    docker build --pull --rm -f "Images/CKAN/2.9/Dockerfile.ckan" -t ghcr.io/salsadigitalauorg/ckan-2.9:2.9.10 "Images/CKAN/2.9" --build-arg CKAN_VERSION="2.9.10" --build-arg LAGOON_VERSION="23.12.0"
#### Build and Push to ghcr
    docker buildx create --name ckan-2.9 --platform linux/amd64,linux/arm64 (Just the first time to create builder)
    docker buildx bake -f ckan-2.9-bake.hcl -f .env.bake --builder ckan-2.9 --push

### CKAN 2.8 (Not supported)
    docker buildx create --name ckan-2.8 --platform linux/amd64,linux/arm64 (Just the first time to create builder)
    docker buildx bake -f ckan-2.8-bake.hcl --builder ckan-2.8 --push

### CKAN Solr 8
#### Build for testing locally
    docker build --pull --rm -f "Images/Solr/8/Dockerfile.solr.ckan-2.9" -t "ghcr.io/salsadigitalauorg/ckan-solr-8:2.9.10" "Images/Solr" --build-arg CKAN_VERSION="2.9.10" --build-arg LAGOON_VERSION="23.12.0"
    docker build --pull --rm -f "Images/Solr/8/Dockerfile.solr.ckan-2.10" -t "ghcr.io/salsadigitalauorg/ckan-solr-8:2.10.3" "Images/Solr" --build-arg CKAN_VERSION="2.10.3" --build-arg LAGOON_VERSION="23.12.0"
#### Build and Push to ghcr
    docker buildx create --name solr-8 --platform linux/amd64,linux/arm64 (Just the first time to create builder)
    docker buildx bake -f solr-8-bake.hcl -f .env.bake --builder solr-8 --push

### CKAN Solr 6 (Not supported)
    docker buildx create --name solr-2.8 --platform linux/amd64,linux/arm64 (Just the first time to create builder)
    docker buildx bake -f solr-6-bake.hcl --builder solr-2.8 --push

### Postgis (Not supported)
    docker buildx create --name postgis --platform linux/amd64,linux/arm64 (Just the first time to create builder)
    docker buildx bake -f postgis-bake.hcl --builder postgis --push
