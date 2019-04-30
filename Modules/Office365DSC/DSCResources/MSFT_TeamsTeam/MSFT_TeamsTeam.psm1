function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        [ValidateLength(1, 256)]
        $DisplayName,

        [Parameter()]
        [System.String]
        $GroupID,

        [Parameter()]
        [System.String]
        [ValidateLength(1, 1024)]
        $Description,

        [Parameter()]
        [System.String]
        $MailNickName,

        [Parameter()]
        [System.String]
        $Owner,

        [Parameter()]
        [System.String]
        [ValidateSet("Public", "Private")]
        $Visibility,

        [Parameter()]
        [System.Boolean]
        $AllowAddRemoveApps,

        [Parameter()]
        [System.Boolean]
        $AllowGiphy,

        [Parameter()]
        [ValidateSet("Strict", "Moderate")]
        [System.String]
        $GiphyContentRating,

        [Parameter()]
        [System.Boolean]
        $AllowStickersAndMemes,

        [Parameter()]
        [System.Boolean]
        $AllowCustomMemes,

        [Parameter()]
        [System.Boolean]
        $AllowUserEditMessages,

        [Parameter()]
        [System.Boolean]
        $AllowUserDeleteMessages,

        [Parameter()]
        [System.Boolean]
        $AllowOwnerDeleteMessages,

        [Parameter()]
        [System.Boolean]
        $AllowCreateUpdateRemoveConnectors,

        [Parameter()]
        [System.Boolean]
        $AllowCreateUpdateRemoveTabs,

        [Parameter()]
        [System.Boolean]
        $AllowCreateUpdateChannels,

        [Parameter()]
        [System.Boolean]
        $AllowDeleteChannels,

        [Parameter()]
        [System.Boolean]
        $AllowTeamMentions,

        [Parameter()]
        [System.Boolean]
        $AllowChannelMentions,

        [Parameter()]
        [System.Boolean]
        $AllowGuestCreateUpdateChannels,

        [Parameter()]
        [System.Boolean]
        $AllowGuestDeleteChannels,

        [Parameter()]
        [ValidateSet("Present", "Absent")]
        [System.String]
        $Ensure = "Present",

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    $nullReturn = @{
        DisplayName                       = $DisplayName
        GroupId                           = $GroupID
        Description                       = $Description
        Owner                             = $Owner
        MailNickName                      = $MailNickName
        Visibility                        = $Visibility
        Ensure                            = "Absent"
        AllowAddRemoveApps                = $AllowAddRemoveApps
        AllowGiphy                        = $AllowGiphy
        GiphyContentRating                = $GiphyContentRating
        AllowStickersAndMemes             = $AllowStickersAndMemes
        AllowCustomMemes                  = $AllowCustomMemes
        AllowUserEditMessages             = $AllowUserEditMessages
        AllowUserDeleteMessages           = $AllowUserDeleteMessages
        AllowOwnerDeleteMessages          = $AllowOwnerDeleteMessages
        AllowCreateUpdateRemoveConnectors = $AllowCreateUpdateRemoveConnectors
        AllowCreateUpdateRemoveTabs       = $AllowCreateUpdateRemoveTabs
        AllowCreateUpdateChannels         = $AllowCreateUpdateChannels
        AllowDeleteChannels               = $AllowDeleteChannels
        AllowTeamMentions                 = $AllowTeamMentions
        AllowChannelMentions              = $AllowChannelMentions
        AllowGuestCreateUpdateChannels    = $AllowGuestCreateUpdateChannels
        AllowGuestDeleteChannels          = $AllowGuestDeleteChannels
        GlobalAdminAccount                = $GlobalAdminAccount
    }

    Write-Verbose -Message "Checking for existance of Team $DisplayName"
    Test-TeamsServiceConnection -GlobalAdminAccount $GlobalAdminAccount

    $team = Get-Team -DisplayName $DisplayName
    if ($null -eq $team)
    {
        Write-Verbose "Teams with displayname $DisplayName doesn't exist"
        return $nullReturn
    }


    Write-Verbose -Message "Found Team $($team.DisplayName)."

    return @{
        DisplayName                       = $team.DisplayName
        GroupID                           = $team.GroupId
        Description                       = $team.Description
        Owner                             = $Owner
        MailNickName                      = $team.MailNickName
        Visibility                        = $team.Visibility
        AllowAddRemoveApps                = $team.AllowAddRemoveApps
        AllowGiphy                        = $team.AllowGiphy
        GiphyContentRating                = $team.GiphyContentRating
        AllowStickersAndMemes             = $team.AllowStickersAndMemes
        AllowCustomMemes                  = $team.AllowCustomMemes
        AllowUserEditMessages             = $team.AllowUserEditMessages
        AllowUserDeleteMessages           = $team.AllowUserDeleteMessages
        AllowOwnerDeleteMessages          = $team.AllowOwnerDeleteMessages
        AllowCreateUpdateRemoveConnectors = $team.AllowCreateUpdateRemoveConnectors
        AllowCreateUpdateRemoveTabs       = $team.AllowCreateUpdateRemoveTabs
        AllowTeamMentions                 = $team.AllowTeamMentions
        AllowChannelMentions              = $team.AllowChannelMentions
        AllowGuestCreateUpdateChannels    = $team.AllowGuestCreateUpdateChannels
        AllowGuestDeleteChannels          = $team.AllowGuestDeleteChannels
        AllowCreateUpdateChannels         = $team.AllowCreateUpdateChannels
        AllowDeleteChannels               = $team.AllowDeleteChannels
        Ensure                            = "Present"
        GlobalAdminAccount                = $GlobalAdminAccount
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        [ValidateLength(1, 256)]
        $DisplayName,

        [Parameter()]
        [System.String]
        $GroupID,

        [Parameter()]
        [System.String]
        [ValidateLength(1, 1024)]
        $Description,

        [Parameter()]
        [System.String]
        $MailNickName,

        [Parameter()]
        [System.String]
        $Owner,

        [Parameter()]
        [System.String]
        [ValidateSet("Public", "Private")]
        $Visibility,

        [Parameter()]
        [System.Boolean]
        $AllowAddRemoveApps,

        [Parameter()]
        [System.Boolean]
        $AllowGiphy,

        [Parameter()]
        [ValidateSet("Strict", "Moderate")]
        [System.String]
        $GiphyContentRating,

        [Parameter()]
        [System.Boolean]
        $AllowStickersAndMemes,

        [Parameter()]
        [System.Boolean]
        $AllowCustomMemes,

        [Parameter()]
        [System.Boolean]
        $AllowUserEditMessages,

        [Parameter()]
        [System.Boolean]
        $AllowUserDeleteMessages,

        [Parameter()]
        [System.Boolean]
        $AllowOwnerDeleteMessages,

        [Parameter()]
        [System.Boolean]
        $AllowCreateUpdateRemoveConnectors,

        [Parameter()]
        [System.Boolean]
        $AllowCreateUpdateRemoveTabs,

        [Parameter()]
        [System.Boolean]
        $AllowCreateUpdateChannels,

        [Parameter()]
        [System.Boolean]
        $AllowDeleteChannels,

        [Parameter()]
        [System.Boolean]
        $AllowTeamMentions,

        [Parameter()]
        [System.Boolean]
        $AllowChannelMentions,

        [Parameter()]
        [System.Boolean]
        $AllowGuestCreateUpdateChannels,

        [Parameter()]
        [System.Boolean]
        $AllowGuestDeleteChannels,

        [Parameter()]
        [ValidateSet("Present", "Absent")]
        [System.String]
        $Ensure = "Present",

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    Test-TeamsServiceConnection -GlobalAdminAccount $GlobalAdminAccount
    Write-Verbose  -Message "Entering Set-TargetResource"
    Write-Verbose  -Message "Retrieving information about team $($DisplayName) to see if it already exists"
    $team = Get-TargetResource @PSBoundParameters

    $CurrentParameters = $PSBoundParameters
    $CurrentParameters.Remove("GlobalAdminAccount")
    $CurrentParameters.Remove("Ensure")

    if ($Ensure -eq "Present" -and ($team.Ensure -eq "Present"))
    {
        ## Can't pass Owner parm into set opertaion
        if ($CurrentParameters.ContainsKey("Owner"))
        {
            $CurrentParameters.Remove("Owner")
        }
        ## if GroupID not passed add from Get-Resource operation
        if ($null -eq $CurrentParameters.ContainsKey("GroupID"))
        {
            $CurrentParameters.Add("GroupID", $team.GroupID)
        }
        Set-Team @CurrentParameters
        Write-Verbose -Message "Updating team group id $($team.GroupID)"
    }
    elseif ($Ensure -eq "Present" -and ($team.Ensure -eq "Absent"))
    {
        ## If group id passed then it will convert existig O365 Group to Team
        ## Several of the existing group properties need removed from cmdlet
        ## https://docs.microsoft.com/en-us/powershell/module/teams/new-team?view=teams-ps
        if ($CurrentParameters.ContainsKey("GroupID"))
        {
            $CurrentParameters.Remove("Visibilty")
            $CurrentParameters.Remove("MailNickName")
            $CurrentParameters.Remove("Description")
            $CurrentParameters.Remove("DisplayName")
            Write-Verbose -Message "Creating team from existing group id $GroupId"
            New-Team @CurrentParameters
        }
        else
        {
            Write-Verbose -Message "Creating team $DisplayName"
            New-Team @CurrentParameters
        }
    }
    elseif ($Ensure -eq "Absent" -and ($team.Ensure -eq "Present"))
    {
        Write-Verbose -Message "Removing team $DisplayName"
        Remove-team -GroupId $team.GroupId
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        [ValidateLength(1, 256)]
        $DisplayName,

        [Parameter()]
        [System.String]
        $GroupID,

        [Parameter()]
        [System.String]
        [ValidateLength(1, 1024)]
        $Description,

        [Parameter()]
        [System.String]
        $MailNickName,

        [Parameter()]
        [System.String]
        $Owner,

        [Parameter()]
        [System.String]
        $Classification,

        [Parameter()]
        [System.String]
        [ValidateSet("Public", "Private")]
        $Visibility,

        [Parameter()]
        [System.Boolean]
        $AllowAddRemoveApps,

        [Parameter()]
        [System.Boolean]
        $AllowGiphy,

        [Parameter()]
        [ValidateSet("Strict", "Moderate")]
        [System.String]
        $GiphyContentRating,

        [Parameter()]
        [System.Boolean]
        $AllowStickersAndMemes,

        [Parameter()]
        [System.Boolean]
        $AllowCustomMemes,

        [Parameter()]
        [System.Boolean]
        $AllowUserEditMessages,

        [Parameter()]
        [System.Boolean]
        $AllowUserDeleteMessages,

        [Parameter()]
        [System.Boolean]
        $AllowOwnerDeleteMessages,

        [Parameter()]
        [System.Boolean]
        $AllowCreateUpdateRemoveConnectors,

        [Parameter()]
        [System.Boolean]
        $AllowCreateUpdateRemoveTabs,

        [Parameter()]
        [System.Boolean]
        $AllowCreateUpdateChannels,

        [Parameter()]
        [System.Boolean]
        $AllowDeleteChannels,

        [Parameter()]
        [System.Boolean]
        $AllowTeamMentions,

        [Parameter()]
        [System.Boolean]
        $AllowChannelMentions,

        [Parameter()]
        [System.Boolean]
        $AllowGuestCreateUpdateChannels,

        [Parameter()]
        [System.Boolean]
        $AllowGuestDeleteChannels,

        [Parameter()]
        [ValidateSet("Present", "Absent")]
        [System.String]
        $Ensure = "Present",

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    Write-Verbose -Message "Testing creation of new Team"
    $CurrentValues = Get-TargetResource @PSBoundParameters
    $ValuesToCheck = $PSBoundParameters
    $ValuesToCheck.Remove('GlobalAdminAccount') | out-null
    $ValuesToCheck.Remove('GroupID') | out-null

    $result = Test-Office365DSCParameterState -CurrentValues $CurrentValues `
        -DesiredValues $PSBoundParameters `
        -ValuesToCheck @("Ensure", `
            "AllowCreateUpdateRemoveTabs", `
            "Description", `
            "MailNickName", `
            "Classification", `
            "Visibility", `
            "AddAllowRemoveApps", `
            "AllowGiphy", `
            "GiphyContent", `
            "AllowStickersandMemes", `
            "AllowCustomMemes", `
            "AllowUserEditMessage", `
            "AllowUserDeleteMessages", `
            "AllowOwnerDeleteMessages", `
            "AllowDeleteChannels", `
            "AllowCreateUpdateRemoveConnectors", `
            "AllowCreateUpdateRemoveTabs", `
            "AllowTeamMentions", `
            "AllowChannelMentions", `
            "AllowGuestCreateUpdateChannels", `
            "AllowGuestDeleteChannels", `
            "AllowCreateUpdateChannels", `
            "DisplayName")

    if (!$result)
    {
        Write-Verbose "Team $DisplayName is not in its Desired State"
    }
    return $result
}

function Export-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        [ValidateLength(1, 256)]
        $DisplayName,

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )
    Test-TeamsServiceConnection -GlobalAdminAccount $GlobalAdminAccount
    $result = Get-TargetResource @PSBoundParameters
    $result.GlobalAdminAccount = Resolve-Credentials -UserName "globaladmin"
    $content = "        TeamsTeam " + (New-GUID).ToString() + "`r`n"
    $content += "        {`r`n"
    $currentDSCBlock = Get-DSCBlock -Params $result -ModulePath $PSScriptRoot
    $content += Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "GlobalAdminAccount"
    $content += "        }`r`n"
    return $content
}

Export-ModuleMember -Function *-TargetResource
