# Get all connected drives
$drives = Get-WmiObject -Class Win32_DiskDrive

# Output header
Write-Output "----------------------------------------------------"
Write-Output "                  Drive Information                 "
Write-Output "----------------------------------------------------"

# Iterate through each drive
foreach ($drive in $drives) {
    # Get drive information
    $driveID = $drive.DeviceID
    $driveModel = $drive.Model
    $driveMediaType = $drive.MediaType
    $driveSerial = $drive.SerialNumber
    $driveSize = [math]::Round($drive.Size / 1GB, 2)  # Convert size to GB and round to 2 decimal places

    # Output drive information with formatting
    Write-Output ("Drive ID:        {0,-20}" -f $driveID)
    Write-Output ("Drive Model:     {0,-20}" -f $driveModel)
    Write-Output ("Drive Type:      {0,-20}" -f $driveMediaType)
    Write-Output ("Serial Number:   {0,-20}" -f $driveSerial)
    Write-Output ("Size:            {0,0} GB" -f $driveSize)
    Write-Output "----------------------------------------------------"
}