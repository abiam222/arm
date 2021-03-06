[CmdletBinding()]
param

(    [Parameter(Mandatory = $true)]
    [string]   
    $featureName,  [Parameter(Mandatory = $true)]
    [string]   
    $serviceName
)

Install-WindowsFeature -name $featureName -IncludeManagementTools -Verbose
$service = Get-Service -Name $serviceName -ErrorAction Stop

if ($service.StartType -ne 'Automatic')
{
    Write-Verbose -Message "Setting startup type for $serviceName to automatic"
    Set-Service -Name $serviceName -StartupType Automatic
}

if ($service.Status -ne 'Running')
{
    Write-Verbose -Message "Starting service $serviceName"
    Start-Service-Name$serviceName
}
