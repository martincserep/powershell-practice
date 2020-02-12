# Declare global variables
$size = 50
$folderName = 'music'
$safetyMode = $false
$files = Get-ChildItem $PSScriptRoot
$currentFolderNum = 0

# Get max folder size
do {
    try {
        $inputOk = $true
        [int]$size = Read-host "Max folder size"
        }
    catch {$inputOk = $false}
    }
until ($inputOk)

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

#Create folder function
function CreateFolder {

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
}
# Create folder with folder name
CreateFolder

#Sort the music
foreach ($current in $files) {
    $currentFolderSize = ((Get-ChildItem $folderName -Recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1MB)
    if ($current.Extension -eq ".mp3") {
        if((($currentFolderSize + $current.Length/1mb) -lt $size)) {
            if ($safetyMode) {
                Copy-Item -Path $current.FullName -Destination $folderName\
            } else {
                Move-Item -Path $current.FullName -Destination $folderName\
            }
        } else {
            $currentFolderSize ++
            $folderName = $folderName + $currentFolderNum
            CreateFolder
            if ($safetyMode) {
                Copy-Item -Path $current.FullName -Destination $folderName\
            } else {
                Move-Item -Path $current.FullName -Destination $folderName\
            }

        }

    }
}
