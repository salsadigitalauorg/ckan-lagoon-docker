group "default" {
    targets = ["cli"]
}

target "cli" {
    dockerfile = "Images/CKAN/2.9/Dockerfile.ckan.python-3.8"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["salsadigitalau/ckan-2.9-py-3.8:2.9.5"]
}