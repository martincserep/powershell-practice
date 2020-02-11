do {
    $operation = Read-Host -Prompt 'What would like to do? "add" "sub" "mult" "divide"'
} until (($operation -eq 'add') -or ($operation -eq 'sub') -or ($operation -eq 'mult') -or ($operation -eq 'divide'))

do {
    try {
        $numOk = $true
        [int]$a = Read-host "First number"
        }
    catch {$numOK = $false}
    }
until ($numOK)

do {
    try {
        $numOk = $true
        [int]$b = Read-Host 'Second number"'
        }
    catch {$numOK = $false}
    }
until ($numOK)

if($operation -eq 'add'){
    printf($a.ToString() + '+' + $b.ToString() + '=' + ($a + $b))
} elseif($operation -eq 'sub'){
    printf($a.ToString() + '-' + $b.ToString() + '=' + ($a - $b))
} elseif($operation -eq 'mult'){
    printf($a.ToString() + '*' + $b.ToString() + '=' + ($a * $b))
} elseif($operation -eq 'divide'){
    printf($a.ToString() + '/' + $b.ToString() + '=' + ($a / $b))
} else {
    printf("wrong")
}
