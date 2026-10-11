resource "confluent_kafka_topic" "kafka_topics" {
  for_each = var.kafka_topics

  topic_name       = each.value.topic_name
  config           = each.value.config
  partitions_count = each.value.partitions_count
  rest_endpoint    = each.value.rest_endpoint

  dynamic "credentials" {
    for_each = each.value.credentials != null ? [each.value.credentials] : []
    content {
      key    = credentials.value.key
      secret = credentials.value.secret
    }
  }

  dynamic "kafka_cluster" {
    for_each = each.value.kafka_cluster != null ? [each.value.kafka_cluster] : []
    content {
      id = kafka_cluster.value.id
    }
  }
}

