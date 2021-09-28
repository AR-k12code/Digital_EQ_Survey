#Simple file to output the Google sheet information to format needed for upload into eschool.

$csvloc = "c:\scripts\Digital EQ Survey (Responses) - Form Responses 1.csv" #If you are using the default name and Google form.
$students = Import-Csv $csvloc
$rows =@()
$district ="405000" #Use number from here https://adedata.arkansas.gov/LEA/Home/districts if you have a leading zero drop it
$outputfileloc = "c:\scripts\DigEQ.csv" #Default save location
$ADstudentID = "EmployeeNumber" #Ad field that contains StudentID
$StuIdLength = "6" #Change to your districts default student ID length (shortest possible number the student ID should be)
$StuIdLeadingNumber = "" #Here for future use; not being used currently
$DefaultInternet = "N" #View ReadMe for specifics for valid answers.
$DefaultInstructionalOption = "1" #View ReadMe for specifics for valid answers.
$DistrictProvided = "DP" #Default entry for Deive source if the answer is left blank: DP,OT,PL only options
$DefaultLearnDevice = "4" #View ReadMe for specifics for valid answers.
$DefaultSharedDevice = "N" #View ReadMe for specifics for valid answers.
$DefaultDeviceSerialNumber = "NotProvided" #View ReadMe for specifics for valid answers.
$DefaultInternetType = "9" #Set to unknown if this is not provided, view readme for valid answers
$DefaultInternetPerformance = "N" #View ReadMe for specifics for valid answers.
$DefaultInternetBarrier = "NA" #View ReadMe for specifics for valid answers.
$LogLoc = "c:\scripts\logs\DigEQ\$(Get-date -format yyyy-MM-dd-HH-mm-ss).log"

Start-Transcript -path $LogLoc
function RemoveSpecials ([String]$in)
{
 $in = $in -replace("[^0-9]","")
 return $in
}


Foreach ($st in $students){
    $stid = RemoveSpecials($st.StudentID)
if ($stid.length -lt $StuIdLength){
    $stid = (Get-ADUser ($st.'Email Address').Split("@")[0] -Properties $ADstudentID).$ADstudentID
}
$stid = $stid.trim()

    Write-host Creating rows for $stid
    For ($i=3;$i -le 11;$i++){
    if ($i -eq "8"){
        $stq = "44"
        $stan =   $stan = ($st.psobject.properties.value[$i]).trim()
    }else{
    $stq = ($st.psobject.properties.value[$i]).split("|")[0].trim()
    $stan = ($st.psobject.properties.value[$i]).split("|")[1].trim()
    }
    if ($stan.length -eq "0"){
        Write-Host "Blank answer using default value for $stq"
        Switch ($stq){
            "38" {$stan = $DefaultInternet}
            "39" {$stan = $DefaultInstructionalOption}
            "40" {$stan = $DistrictProvided}
            "42" {$stan = $DefaultLearnDevice}
            "43" {$stan = $DefaultSharedDevice}
            "44" {$stan = ($DefaultDeviceSerialNumber+$stid)}
            "45" {$stan = $DefaultInternetType}
            "46" {$stan = $DefaultInternetPerformance}
            "47" {$stan = $DefaultInternetBarrier}
        Default {$stan = $stan}
        }
    }
    $rows += "$district,$stid,102,$stq,1,$stan"
    }
    Write-host "Finished rows for $stid"
    }

    $rows |Out-File $outputfileloc -Encoding ascii
    Stop-Transcript
