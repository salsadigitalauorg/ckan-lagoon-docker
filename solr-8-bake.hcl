group "default" {
    targets = ["cli"]
}

target "cli" {
    dockerfile = "Images/Solr/8/Dockerfile.solr"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["salsadigitalau/ckan-solr-8:2.9.8"]
}