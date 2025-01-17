variable "CKAN_2_10_VERSION" {
  default = null
}

variable "LAGOON_VERSION" {
  default = null
}

group "default" {
    targets = ["ckan-2-10"]
}

target "ckan-2-10" {
    dockerfile = "Images/Solr/8/Dockerfile.solr.ckan-2.10"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["ghcr.io/salsadigitalauorg/ckan-solr-8:${CKAN_2_10_VERSION}"]
    args = {
        CKAN_VERSION = "${CKAN_2_10_VERSION}",
        LAGOON_VERSION = "${LAGOON_VERSION}"
    }
}