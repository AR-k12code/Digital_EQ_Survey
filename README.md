### Digital_EQ_Survey
Eschool Upload for Digital Equity survey; all fields

## Eschool Upload Definition fields:
  InterfaceID  
    DigEQ  
  Description  
    Digital Equity Upload  
   Header  
      1  
    Filename  
      DigEQ.csv        
    Delimit Character  
      ,  
    Table Affected  
      reg_user  
      
      Interface Details:
      |Order|Field ID|Table Name|Table Alias|Column Name|Field Length|
      |---|---|---|---|---|---|
      |1|10|reg_user||District|12|
      |2|20|reg_user||Student_ID|16|
      |3|30|reg_user||Screen_number|4|
      |4|40|reg_user||Field_number|4|
      |5|50|reg_user||List_Sequence|4|
      |6|60|reg_user||Field_Value|255|
## File Format
district,Student_ID,Screen_Number,Field_number,List_Sequence,Field_Value
>sample  
>405000,123456,102,38,1,Y
  
Each Question and entry will have its own line if you do all 9 questions for a student you will need 9 lines per student.  
#### Screen_Number
For these specific questions they should all be on Screen 102

#### Field_Number
Mapping the fields to the questions is the "tricky Part here is the cheatsheet I have found  

>Internet Access = 38  
>student instructional option = 39  
>Device Access Source = 40  
>learnign device = 42  
>Shared Device = 43  
>Device Serial Number = 44  
>Internet Type = 45  
>Internet Performance = 46  
>Internet Barrier = 47  

##### Field_Number Validations:
The first value before the | is the validation and is what goes in the file. After the | is the human readable descriptor.  
>38 | Internet Access  
>Y | Yes  
>N | No  
>39 | Student Instructional Option  
>1 | Onsite/Traditional Learning  
>2 | Virtual/Remote Learning  
>3 | Hybrid/Blended learning  
>4 | NA No Show/No Activity  
>40 | Device Access Source
>DP | District Provided  
>OT | Other  
>PL | Personal  
>42 | Learning Device
>1 | Desktop Computer  
>2 | Laptop Computer  
>3 | Tablet  
>4 | Chromebook  
>5 | SmartPhone  
>6 | None  
>7 | Other  
>43 | Shared Device  
>N | Not Shared  
>S | Shared  
>U | Unknown  
>44 | Device Serial Number  
>Varchar field; I suggest keeping it to under ~200 characters I haven't double checked this on the SQL table directly.  
>45 | Internet Type  
>1 | Residential Broadband  
>2 | Cellular Network  
>3 | Hot Spot  
>4 | Community provided Wi-Fi  
>5 | Satellite  
>6 | Dial-up  
>7 | Other  
>8 | None  
>9 | Unknown  
>46 | Internet Performance  
> N | No-Unable to access Internet  
> S | Sometimes- Regularly experience internet interruptions  
> Y | Yes- Few or No internet interruptions  
> 47 | Internet Bzarrier
> AFF | Not Affordable  
> NA | Not Applicable  
> AVL | Not Available  
> OTR | Other
