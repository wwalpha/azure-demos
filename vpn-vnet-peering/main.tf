terraform {
  backend "local" {
    path = "./tfstate/terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.0.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

  use_msi = true
}

resource "azurerm_resource_group" "this" {
  depends_on = [random_id.this]
  name       = "${var.resource_group_name}-${local.suffix}"
  location   = var.resource_group_location
}

# module "storage" {
#   source = "./storage"

#   suffix                  = local.suffix
#   tenant_id               = local.tenant_id
#   resource_group_name     = azurerm_resource_group.this.name
#   resource_group_location = azurerm_resource_group.this.location
# }

# module "security" {
#   source = "./security"
# }

module "networking" {
  source = "./networking"

  suffix                  = local.suffix
  tenant_id               = local.tenant_id
  resource_group_name     = azurerm_resource_group.this.name
  resource_group_location = azurerm_resource_group.this.location
}

module "computing" {
  source = "./computing"

  suffix                  = local.suffix
  resource_group_name     = azurerm_resource_group.this.name
  resource_group_location = azurerm_resource_group.this.location
  azurevm_admin_username  = var.azurevm_admin_username
  azurevm_admin_password  = var.azurevm_admin_password
  vm1_subnet_id           = module.networking.vnet1_subnet_id
  vm2_subnet_id           = module.networking.vnet2_subnet_id
}
