  $ImdsServer = "http://169.254.169.254"
	$InstanceEndpoint = $ImdsServer + "/metadata/instance"
	$AttestedEndpoint = $ImdsServer + "/metadata/attested/document"
	$NonceValue = "123456"


function Query-InstanceEndpoint
	{
	    $uri = $InstanceEndpoint + "?api-version=2021-02-01"
	    $result = Invoke-RestMethod -Method GET -NoProxy -Uri $uri -Headers @{"Metadata"="True"}
	    return $result
	}

$result = Query-InstanceEndpoint
$result | ConvertTo-JSON -Depth 99
