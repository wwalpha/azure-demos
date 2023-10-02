data "azurerm_subscription" "primary" {}

resource "azurerm_role_definition" "this" {
  name  = "ContainerInstanceContributer"
  scope = data.azurerm_subscription.primary.id

  permissions {
    actions = [
      "Microsoft.ContainerInstance/register/action",
      "Microsoft.ContainerInstance/containerGroups/read",
      "Microsoft.ContainerInstance/containerGroups/write",
      "Microsoft.ContainerInstance/containerGroups/delete",
      "Microsoft.ContainerInstance/containerGroups/restart/action",
      "Microsoft.ContainerInstance/containerGroups/stop/action",
      "Microsoft.ContainerInstance/containerGroups/refreshDelegatedResourceIdentity/action",
      "Microsoft.ContainerInstance/containerGroups/start/action",
      "Microsoft.ContainerInstance/containerGroups/containers/exec/action",
      "Microsoft.ContainerInstance/containerGroups/containers/attach/action",
      "Microsoft.ContainerInstance/containerGroups/containers/buildlogs/read",
      "Microsoft.ContainerInstance/containerGroups/containers/logs/read",
      "Microsoft.ContainerInstance/containerGroups/detectors/read",
      "Microsoft.ContainerInstance/containerGroups/outboundNetworkDependenciesEndpoints/read",
      "Microsoft.ContainerInstance/containerGroups/providers/Microsoft.Insights/diagnosticSettings/read",
      "Microsoft.ContainerInstance/containerGroups/providers/Microsoft.Insights/diagnosticSettings/write",
      "Microsoft.ContainerInstance/containerGroups/providers/Microsoft.Insights/metricDefinitions/read",
      "Microsoft.ContainerInstance/containerGroups/operationResults/read",
      "Microsoft.ContainerInstance/containerGroupProfiles/read",
      "Microsoft.ContainerInstance/containerGroupProfiles/write",
      "Microsoft.ContainerInstance/containerGroupProfiles/delete",
      "Microsoft.ContainerInstance/containerGroupProfiles/revisions/read",
      "Microsoft.ContainerInstance/containerGroupProfiles/revisions/deregister/action",
      "Microsoft.ContainerInstance/operations/read",
      "Microsoft.ContainerInstance/serviceassociationlinks/delete",
      "Microsoft.ContainerInstance/locations/validateDeleteVirtualNetworkOrSubnets/action",
      "Microsoft.ContainerInstance/locations/deleteVirtualNetworkOrSubnets/action",
      "Microsoft.ContainerInstance/locations/cachedImages/read",
      "Microsoft.ContainerInstance/locations/capabilities/read",
      "Microsoft.ContainerInstance/locations/operationResults/read",
      "Microsoft.ContainerInstance/locations/operations/read",
      "Microsoft.ContainerInstance/locations/usages/read"
    ]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
}
