output "id" {
  value       = google_memorystore_instance.instance.id
  description = "MemoryStore instance ID."
}

output "endpoints" {
  value       = google_memorystore_instance.instance.endpoints
  description = "Endpoints clients can connect to the instance through."
}
