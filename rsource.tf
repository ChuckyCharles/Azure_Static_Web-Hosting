resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestorage123"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "production"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = "$web"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "azurerm_storage_static_website" "example" {
  storage_account_name = azurerm_storage_account.example.name
  index_document       = "index.html"
  error_404_document   = "404.html"
}
