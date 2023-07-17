resource "azurerm_cdn_profile" "cdnprofile" {
  name                = var.cdnprofilename
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "cdnendpoint" {
  name                = var.cdnendpointname
  profile_name        = azurerm_cdn_profile.cdnprofile.name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  origin {
    name      = var.cdnendpointname
    host_name = "tfazresumestorage.z6.web.core.windows.net"

  }

  origin_host_header = "tfazresumestorage.z6.web.core.windows.net"

  is_http_allowed  = true
  is_https_allowed = true
}

resource "azurerm_cdn_endpoint_custom_domain" "cdndomain" {
  name            = "tomonnegren"
  cdn_endpoint_id = azurerm_cdn_endpoint.cdnendpoint.id
  host_name       = "www.tomonnegren.se"
  
  cdn_managed_https {
    certificate_type = "Dedicated"
    protocol_type    = "ServerNameIndication"
    tls_version      = "TLS12"
  }
}