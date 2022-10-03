resource "kubernetes_manifest" "deployment_todo_be" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "annotations" = {
        "deployment.kubernetes.io/revision" = "5"
      }
      "generation" = 5
      "name" = "todo-be"
    }
    "spec" = {
      "progressDeadlineSeconds" = 600
      "replicas" = 1
      "revisionHistoryLimit" = 10
      "selector" = {
        "matchLabels" = {
          "name" = "todo-be"
        }
      }
      "strategy" = {
        "rollingUpdate" = {
          "maxSurge" = "25%"
          "maxUnavailable" = "25%"
        }
        "type" = "RollingUpdate"
      }
      "template" = {
        "metadata" = {
          "creationTimestamp" = null
          "labels" = {
            "name" = "todo-be"
          }
          "name" = "todo-be"
        }
        "spec" = {
          "containers" = [
            {
              "env" = [
                {
                  "name" = "DB_USER"
                  "value" = "postgres"
                },
                {
                  "name" = "DB_PASSWORD"
                  "value" = "rahasia"
                },
                {
                  "name" = "DB_HOST"
                  "value" = "postgres"
                },
                {
                  "name" = "DB_PORT"
                  "value" = "5432"
                },
                {
                  "name" = "DB_DATABASE"
                  "value" = "belajar"
                },
              ]
              "image" = "docker.io/fadellh/todo-be:latest"
              "imagePullPolicy" = "Always"
              "name" = "todo-be"
              "ports" = [
                {
                  "containerPort" = 8080
                  "protocol" = "TCP"
                },
              ]
              "resources" = {}
              "terminationMessagePath" = "/dev/termination-log"
              "terminationMessagePolicy" = "File"
            },
          ]
          "dnsPolicy" = "ClusterFirst"
          "restartPolicy" = "Always"
          "schedulerName" = "default-scheduler"
          "securityContext" = {}
          "terminationGracePeriodSeconds" = 30
        }
      }
    }
  }
}
