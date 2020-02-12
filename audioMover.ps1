# Declare global variables
$folderName = 'music'
$safetyMode = $false
$files = Get-ChildItem $PSScriptRoot

# Get folder name
do {
    try {
        $folderName = Read-host "Folder name"
        if((Test-Path -LiteralPath $PSScriptRoot\$folderName)){
            "Directory already existed"
            $inputOk = $false
        } else {
            $inputOk = $true
        }
        }
    catch {$inputOk = $false}
    }
until ($inputOk)

# User safety mode or not 
do {
    try {
        $wantSafety = Read-host "Safety mode? true or false"
        if($wantSafety.ToLower() -eq 'true') {
            $safetyMode = $true
            $inputOk = $true
        } elseif ($wantSafety.ToLower() -eq 'false') {
            $safetyMode = $false
            $inputOk = $true
        }
    }
    catch {$inputOk = $false}
    }
until ($inputOk)

# Create folder with folder name
if (-not (Test-Path -LiteralPath $PSScriptRoot\$folderName)) {
    
    try {
        New-Item -Path $PSScriptRoot\$folderName -ItemType Directory -ErrorAction Stop | Out-Null #-Force
    }
    catch {
        Write-Error -Message "Unable to create directory '$PSScriptRoot\$folderName'. Error was: $_" -ErrorAction Stop
    }
    "Successfully created directory '$PSScriptRoot\$folderName'."

}
else {
    "Directory already existed"
}

foreach ($current in $files) {
    if ($current.Extension -eq ".mp3") {
            if ($safetyMode) {
                Copy-Item -Path $current.FullName -Destination $folderName\
            } else {
                Move-Item -Path $current.FullName -Destination $folderName\
            }
        } else {
            $currentFolderSize ++

        }
}
printf('All file ')
if($safetyMode) {
    printf('copied')
} else {
    printf('moved')
}
printf(' to: ' + $folderName + "`n")