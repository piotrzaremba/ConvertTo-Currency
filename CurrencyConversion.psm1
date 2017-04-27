function ConvertTo-Currency 
{
    param (
        [double]$Amount,
        [string]$Source,
        [string]$Destination)
 
    $Currency = New-WebServiceProxy -Uri http://www.webservicex.net/CurrencyConvertor.asmx?WSDL
    $ConversionRate = $Currency.ConversionRate($Source, $Destination)
    $DestinationAmount = $Amount * $ConversionRate

    Write-Host "$Amount $Source convert to $DestinationAmount $Destination"
} 

Export-ModuleMember -function ConvertTo-Currency