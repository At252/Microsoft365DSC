<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Apps
{
    Import-DSCResource -ModuleName Office365DSC
    $credsGlobalAdmin = Get-Credential -UserName "TenantAdmin@O365DSC1.onmicrosoft.com" -Message "Global Admin"
    Node localhost
    {
        SPOApp ee4a977d-4d7d-4968-9238-2a1702aa699c
        {
            Identity           = "DemoApp"
            Path               = "C:\Demo\DemoApp.sppkg"
            Publish            = $true
            CentralAdminUrl    = "https://Office365DSC-admin.sharepoint.com"
            GlobalAdminAccount = $credsGlobalAdmin
            Ensure             = "Present"
        }

        SPOApp ee4a977d-4eee-4968-9238-2a1702aa1234
        {
            Identity           = "DemoApp2"
            Path               = "C:\Demo\DemoApp2.app"
            Publish            = $true
            CentralAdminUrl    = "https://Office365DSC-admin.sharepoint.com"
            GlobalAdminAccount = $credsGlobalAdmin
            Ensure             = "Present"
        }
    }
}

$configData = @{
    AllNodes = @(
        @{
            NodeName                    = "localhost"
            PSDscAllowPlainTextPassword = $true;
            PSDscAllowDomainUser        = $true;
        }
    )
}

Apps -ConfigurationData $configData