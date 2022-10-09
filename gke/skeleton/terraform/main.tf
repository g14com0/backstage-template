provider "google" {
  project = ${{values.gcloudProject | dump}}
}

module "google_kubernetes_cluster" {
  source = "github.com/g14com0/terraform-modules//gke?ref=main"

  name                     = "cluster-a"
  project                  = ${{values.gcloudProject | dump}}
  remove_default_node_pool = false

  regions = "europe-west3"
  zone    = ["europe-west3-a"]
  zonal   = true
  node_pools = [
    {
      machine_type = "e2-medium"
      image_type   = "COS_CONTAINERD"
    },
  ]
}