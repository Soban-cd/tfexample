variable "project_id" {
  type        = string
  description = "Google project ID."
}

variable "region" {
  type        = string
  description = "Google project region."
}

variable "network_ids" {
  type        = list(string)
  description = "List of network IDs."
}

variable "instance_id" {
  type        = string
  description = "ID to use for the MemoryStore instance."
}

variable "shard_count" {
  type        = number
  default     = 1
  description = "Number of shards."
}

variable "mode" {
  type        = string
  default     = "CLUSTER_DISABLED"
  description = "MemoryStore operation mode. Possible values are: CLUSTER, CLUSTER_DISABLED."
}

variable "node_type" {
  type        = string
  default     = "SHARED_CORE_NANO"
  description = "MemoryStore instance node type. Possible values are: SHARED_CORE_NANO, HIGHMEM_MEDIUM, HIGHMEM_XLARGE, STANDARD_SMALL"
}
