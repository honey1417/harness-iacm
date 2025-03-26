output "lb_external_ip" {
  description = "The external IP address of the load balancer"
  value       = module.LB.global_forwarding_rule_ip
}