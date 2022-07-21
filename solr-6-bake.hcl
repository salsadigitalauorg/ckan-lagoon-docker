group "default" {
    targets = ["cli"]
}

target "cli" {
    dockerfile = "Images/Solr/6/Dockerfile.solr"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["salsadigitalau/ckan-solr-6:2.8"]
}