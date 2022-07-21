group "default" {
    targets = ["cli"]
}

target "cli" {
    dockerfile = "Images/CKAN/2.9/Dockerfile.ckan"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["salsadigitalau/ckan-2.9:2.9.5"]
}