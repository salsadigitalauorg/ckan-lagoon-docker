group "default" {
    targets = ["postgis"]
}

target "postgis" {
    context  = "Images/Postgres"
    dockerfile = "Dockerfile.postgis"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["salsadigitalau/postgis:3.3.2"]
}