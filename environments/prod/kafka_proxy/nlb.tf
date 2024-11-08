# Create Kubernetes kafka service type NodePort
resource "kubernetes_service" "kraft-0-external" {
  metadata {
    name = "kraft-0-external"
    labels = {
      "app" = "kraft"
    }
    namespace = "kafka"
  }
  spec {
    type = "NodePort"
    port {
      name        = "kraft-0-external"
      port        = 19094
      target_port = "kraft-external"
    }
    selector = {
      "app"                                = "kraft"
      "statefulset.kubernetes.io/pod-name" = "kraft-0"
    }
  }
}

resource "kubernetes_service" "kraft-1-external" {
  metadata {
    name = "kraft-1-external"
    labels = {
      "app" = "kraft"
    }
    namespace = "kafka"
  }
  spec {
    type = "NodePort"
    port {
      name        = "kraft-1-external"
      port        = 19095
      target_port = "kraft-external"
    }
    selector = {
      "app"                                = "kraft"
      "statefulset.kubernetes.io/pod-name" = "kraft-1"
    }
  }
}

resource "kubernetes_service" "kraft-2-external" {
  metadata {
    name = "kraft-2-external"
    labels = {
      "app" = "kraft"
    }
    namespace = "kafka"
  }
  spec {
    type = "NodePort"
    port {
      name        = "kraft-2-external"
      port        = 19096
      target_port = "kraft-external"
    }
    selector = {
      "app"                                = "kraft"
      "statefulset.kubernetes.io/pod-name" = "kraft-2"
    }
  }
}

resource "kubernetes_service" "kraft-3-external" {
  metadata {
    name = "kraft-3-external"
    labels = {
      "app" = "kraft"
    }
    namespace = "kafka"
  }
  spec {
    type = "NodePort"
    port {
      name        = "kraft-3-external"
      port        = 19097
      target_port = "kraft-external"
    }
    selector = {
      "app"                                = "kraft"
      "statefulset.kubernetes.io/pod-name" = "kraft-3"
    }
  }
}

resource "kubernetes_service" "kraft-4-external" {
  metadata {
    name = "kraft-4-external"
    labels = {
      "app" = "kraft"
    }
    namespace = "kafka"
  }
  spec {
    type = "NodePort"
    port {
      name        = "kraft-3-external"
      port        = 19098
      target_port = "kraft-external"
    }
    selector = {
      "app"                                = "kraft"
      "statefulset.kubernetes.io/pod-name" = "kraft-4"
    }
  }
}

# Create AWS NLB Load Balancer and attach to Kubernetes services above
resource "aws_lb" "kafka-proxy" {
  name                       = "kafka-proxy-${local.environment}"
  internal                   = true
  load_balancer_type         = "network"
  subnets                    = local.private_subnets
  enable_deletion_protection = false

  tags = {
    Name        = "kafka-proxy"
    Environment = local.environment
  }

  depends_on = [
    kubernetes_service.kraft-0-external,
    kubernetes_service.kraft-1-external,
    kubernetes_service.kraft-2-external,
    kubernetes_service.kraft-3-external,
    kubernetes_service.kraft-4-external
  ]
}


resource "aws_lb_target_group" "kraft-0-external" {
  name        = "kraft-0-external-${local.environment}"
  port        = 19094
  protocol    = "TCP"
  vpc_id      = local.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "kraft-1-external" {
  name        = "kraft-1-external-${local.environment}"
  port        = 19095
  protocol    = "TCP"
  vpc_id      = local.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "kraft-2-external" {
  name        = "kraft-2-external-${local.environment}"
  port        = 19096
  protocol    = "TCP"
  vpc_id      = local.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "kraft-3-external" {
  name        = "kraft-3-external-${local.environment}"
  port        = 19097
  protocol    = "TCP"
  vpc_id      = local.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group" "kraft-4-external" {
  name        = "kraft-4-external-${local.environment}"
  port        = 19098
  protocol    = "TCP"
  vpc_id      = local.vpc_id
  target_type = "instance"
}

resource "aws_lb_listener" "kraft-0-external" {
  load_balancer_arn = aws_lb.kafka-proxy.arn
  port              = "19094"
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.kraft-0-external.arn
    type             = "forward"
  }

  depends_on = [
    aws_lb_target_group.kraft-0-external
  ]
}

resource "aws_lb_listener" "kraft-1-external" {
  load_balancer_arn = aws_lb.kafka-proxy.arn
  port              = "19095"
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.kraft-1-external.arn
    type             = "forward"
  }

  depends_on = [
    aws_lb_target_group.kraft-1-external
  ]
}

resource "aws_lb_listener" "kraft-2-external" {
  load_balancer_arn = aws_lb.kafka-proxy.arn
  port              = "19096"
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.kraft-2-external.arn
    type             = "forward"
  }

  depends_on = [
    aws_lb_target_group.kraft-2-external
  ]
}

resource "aws_lb_listener" "kraft-3-external" {
  load_balancer_arn = aws_lb.kafka-proxy.arn
  port              = "19097"
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.kraft-3-external.arn
    type             = "forward"
  }

  depends_on = [
    aws_lb_target_group.kraft-3-external
  ]
}

resource "aws_lb_listener" "kraft-4-external" {
  load_balancer_arn = aws_lb.kafka-proxy.arn
  port              = "19098"
  protocol          = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.kraft-4-external.arn
    type             = "forward"
  }

  depends_on = [
    aws_lb_target_group.kraft-4-external
  ]
}

# Create domain name for AWS NLB
resource "aws_route53_record" "kafka-proxy" {
  zone_id = local.dns_zone_id
  name    = "kafka-proxy.${local.main_domain}"
  type    = "A"

  alias {
    name                   = aws_lb.kafka-proxy.dns_name
    zone_id                = aws_lb.kafka-proxy.zone_id
    evaluate_target_health = false
  }

  depends_on = [
    aws_lb.kafka-proxy,
  ]
}

