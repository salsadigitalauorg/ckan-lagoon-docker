group "default" {
    targets = ["ckan-2-9", "ckan-2-10"]
}

target "ckan-2-9" {
    dockerfile = "Images/Solr/8/Dockerfile.solr.ckan-2.9"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["ghcr.io/salsadigitalauorg/ckan-solr-8:2.9.9"]
}

target "ckan-2-10" {
    dockerfile = "Images/Solr/8/Dockerfile.solr.ckan-2.10"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["ghcr.io/salsadigitalauorg/ckan-solr-8:2.10.1"]
}