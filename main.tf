data "template_file" "init" {
  template = "${file("${path.module}/template.json")}"
}


resource "azurerm_template_deployment" "sql-cluster" {
  name                = "sql-always-on"
  resource_group_name = "${var.allspark["resource_group_name"]}"

  parameters = {
    adminUsername="sqlAdmin"
    adminPassword="sqlServerAdmin123!"
    adVMSize="Standard_D2_v2"
    sqlVMSize="Standard_DS3_v2"
    witnessVMSize="Standard_DS2_v2"
    domainName="xm.int"
    sqlServerServiceAccountUserName="sqlservice"
    sqlServerServiceAccountPassword="sqlServerService123!"
    sqlStorageAccountName="atsrpwsao"
    sqlStorageAccountType="Premium_LRS"
    virtualNetworkName="sao"
    autoPatchingDay="Sunday"
    autoPatchingStartHour="2"
    sqlAOAGName="sao-ag"
    sqlAOListenerPort="1433"
    sqlAOListenerName="sao-listener"
    sqlServerVersion="SQL2016-WS2012R2-ENT"
    numberOfSqlVMDisks="1"
    workloadType="GENERAL"
  }

  template_body = "${data.template_file.init.rendered}"

  deployment_mode = "Incremental"
}
