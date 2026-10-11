output "kafka_topics_id" {
  description = "Map of id values across all kafka_topics, keyed the same as var.kafka_topics except keys with no id are omitted"
  value       = { for k, v in confluent_kafka_topic.kafka_topics : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kafka_topics_config" {
  description = "Map of config values across all kafka_topics, keyed the same as var.kafka_topics except keys with no config are omitted"
  value       = { for k, v in confluent_kafka_topic.kafka_topics : k => v.config if v.config != null && length(v.config) > 0 }
}
output "kafka_topics_credentials" {
  description = "Map of credentials values across all kafka_topics, keyed the same as var.kafka_topics except keys with no credentials are omitted"
  value       = { for k, v in confluent_kafka_topic.kafka_topics : k => one(v.credentials) if v.credentials != null && length(v.credentials) > 0 }
  sensitive   = true
}
output "kafka_topics_kafka_cluster" {
  description = "Map of kafka_cluster values across all kafka_topics, keyed the same as var.kafka_topics except keys with no kafka_cluster are omitted"
  value       = { for k, v in confluent_kafka_topic.kafka_topics : k => one(v.kafka_cluster) if v.kafka_cluster != null && length(v.kafka_cluster) > 0 }
}
output "kafka_topics_partitions_count" {
  description = "Map of partitions_count values across all kafka_topics, keyed the same as var.kafka_topics except keys with no partitions_count are omitted"
  value       = { for k, v in confluent_kafka_topic.kafka_topics : k => v.partitions_count if v.partitions_count != null }
}
output "kafka_topics_rest_endpoint" {
  description = "Map of rest_endpoint values across all kafka_topics, keyed the same as var.kafka_topics except keys with no rest_endpoint are omitted"
  value       = { for k, v in confluent_kafka_topic.kafka_topics : k => v.rest_endpoint if v.rest_endpoint != null && length(v.rest_endpoint) > 0 }
}
output "kafka_topics_topic_name" {
  description = "Map of topic_name values across all kafka_topics, keyed the same as var.kafka_topics except keys with no topic_name are omitted"
  value       = { for k, v in confluent_kafka_topic.kafka_topics : k => v.topic_name if v.topic_name != null && length(v.topic_name) > 0 }
}

