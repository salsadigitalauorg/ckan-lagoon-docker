variable "CKAN_2_10_VERSION" {
  default = null
}

variable "LAGOON_VERSION" {
  default = null
}

group "default" {
    targets = ["ckan"]
}

target "ckan" {
    context  = "Images/CKAN/2.10"
    dockerfile = "Dockerfile.ckan"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["ghcr.io/salsadigitalauorg/ckan-2.10:${CKAN_2_10_VERSION}"]
    args = {
        CKAN_VERSION = "${CKAN_2_10_VERSION}",
        LAGOON_VERSION = "${LAGOON_VERSION}"
  }
}