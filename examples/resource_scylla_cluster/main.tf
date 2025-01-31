terraform {
	required_providers {
		scylladbcloud = {
			source = "registry.terraform.io/scylladb/scylladbcloud"
		}
	}
}

provider "scylladbcloud" {
	token = "..."
}

resource "scylladbcloud_cluster" "scylladbcloud" {
	name       = "My Cluster"
	region     = "us-east-1"
	node_count = 3
	node_type  = "i3.xlarge"
	cidr_block = "172.31.0.0/16"

	enable_vpc_peering = true
	enable_dns         = true
}

output "scylladbcloud_cluster_id" {
	value = scylladbcloud_cluster.scylladbcloud.id
}

output "scylladbcloud_cluster_datacenter" {
	value = scylladbcloud_cluster.scylladbcloud.datacenter
}
