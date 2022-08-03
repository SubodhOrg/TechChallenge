function GetValue($object, [string[]]$keys)
{
    $propertyName = $keys[0]
    if($keys.count.Equals(1)){
        return $object.$propertyName
    }
    else { 
        return GetValue -object $object.$propertyName -key ($keys | Select-Object -Skip 1)
    }
}

Write-Host "First Output"
$Obj = ConvertFrom-Json '{"a":{"b":{"c":"d"}}}'

$value = GetValue $Obj -key "a/b/c".Split("/")
Write-Host $value

Write-Host "Second Output"
$Obj = ConvertFrom-Json '{"x":{"y":{"z":"a"}}}'

$value = GetValue $Obj -key "x/y/z".Split("/")
Write-Host $value


