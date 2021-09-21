#Simple file to output the Google sheet information to format needed for upload into eschool.

$csvloc = ""
$students = Import-Csv $csvloc
$rows =@()
$district ="405000"
$outputfileloc = ""



Foreach ($st in $students){
    $stid = $st.StudentID
    Write-host Creating rows for $stid
    For ($i=1;$i -le 10;$i++){
    $stq = $stu.psobject.properties.name[$i]
    $stan = $stu.psobject.properties.value[$i]
    $rows += "$district,$stid,102,$stq,1,$stan"
    }
    Write-host "Finished rows for $stid"
    }

    $rows |Out-File $outputfileloc -Encoding ascii