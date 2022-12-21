group "default" {
    targets = ["ckan-py-3-9"]
}

target "ckan-py" {
    context  = "Images/CKAN/2.9"
    dockerfile = "Dockerfile.ckan"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["salsadigitalau/ckan-2.9:2.9.7"]
}

target "ckan-py-3-8" {
    context  = "Images/CKAN/2.9"
    dockerfile = "Dockerfile.ckan.python-3.8"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["salsadigitalau/ckan-2.9-py-3.8:2.9.7"]
}

target "ckan-py-3-9" {
    context  = "Images/CKAN/2.9"
    dockerfile = "Dockerfile.ckan.python-3.9"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["salsadigitalau/ckan-2.9-py-3.9:2.9.7"]
}