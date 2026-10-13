resource "azurerm_lb_probe" "http" {
  name                = "http-nodeport"
  loadbalancer_id     = azurerm_lb.cluster.id
  protocol            = "Http"
  port                = 30080
  request_path        = "/"
  interval_in_seconds = 15
  number_of_probes    = 2
}

