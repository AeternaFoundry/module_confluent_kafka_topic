variable "kafka_topics" {
  description = <<EOT
Map of kafka_topics, attributes below
Required:
    - topic_name
Optional:
    - config
    - partitions_count
    - rest_endpoint
    - credentials (block):
        - key (required)
        - secret (required)
    - kafka_cluster (block):
        - id (required)
EOT

  type = map(object({
    topic_name       = string
    config           = optional(map(string))
    partitions_count = optional(number)
    rest_endpoint    = optional(string)
    credentials = optional(object({
      key    = string
      secret = string
    }))
    kafka_cluster = optional(object({
      id = string
    }))
  }))
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

