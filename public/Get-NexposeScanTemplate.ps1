Function Get-NexposeScanTemplate {
<#
    .SYNOPSIS
        Returns a scan template

    .DESCRIPTION
        Returns a scan template

    .PARAMETER Id
        The identifier of the scan template

    .PARAMETER Name
        The name of the scan template

    .EXAMPLE
        Get-NexposeScanTemplate

    .NOTES
        For additional information please see my GitHub wiki page

    .FUNCTIONALITY
        GET: scan_templates
        GET: scan_templates/{id}

    .LINK
        https://github.com/My-Random-Thoughts/Rapid7Nexpose
#>

    [CmdletBinding(DefaultParameterSetName = 'byId')]
    Param (
        [Parameter(ParameterSetName = 'byId')]
        [string]$Id,

        [Parameter(ParameterSetName = 'byName')]
        [string]$Name
    )

    Switch ($PSCmdlet.ParameterSetName) {
        'byId' {
            If ($Id) {
                Write-Output (Invoke-NexposeQuery -UrlFunction "scan_templates/$Id" -RestMethod Get)
            }
            Else {
                Write-Output @(Invoke-NexposeQuery -UrlFunction "scan_templates" -RestMethod Get)    # Return All
            }
        }

        'byName' {
            $Name = (ConvertTo-NexposeId -Name $Name -ObjectType ScanTemplate)
            Get-NexposeScanTemplate -Id $Name
        }
    }
}
