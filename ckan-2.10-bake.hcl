group "default" {
    targets = ["ckan"]
}

target "ckan" {
    context  = "Images/CKAN/2.10"
    dockerfile = "Dockerfile.ckan"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["ghcr.io/salsadigitalauorg/ckan-2.10:2.10.1"]
}