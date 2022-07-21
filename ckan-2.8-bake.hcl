group "default" {
    targets = ["cli"]
}

target "cli" {
    dockerfile = "Images/CKAN/2.8/Dockerfile.ckan"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["salsadigitalau/ckan-2.8:2.8.8"]
}