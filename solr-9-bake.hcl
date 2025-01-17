variable "CKAN_2_11_VERSION" {
  default = null
}

variable "LAGOON_VERSION" {
  default = null
}

group "default" {
    targets = ["ckan-2-11"]
}

target "ckan-2-11" {
    dockerfile = "Images/Solr/8/Dockerfile.solr.ckan-2.11"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["ghcr.io/salsadigitalauorg/ckan-solr-9:${CKAN_2_11_VERSION}"]
    args = {
        CKAN_VERSION = "${CKAN_2_11_VERSION}",
        LAGOON_VERSION = "${LAGOON_VERSION}"
    }
}