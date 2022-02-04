use ims;


/*A1:SQL Question - 
Produce a query that 
shows a list of patients and any measurements (lab tests, vitals, etc.) that they have had.*/

SELECT p.LastName,p.FirstName, lt.Name as 'name',lv.Value as 'value',lv.DateTaken as 'Date Taken'
FROM patients as p
JOIN labvalues as lv
ON p.patientID = lv.Patient
JOIN labvaluetypes as lt
ON lv.ValueType = lt.TypeID
ORDER BY p.LastName,p.FirstName,lv.ValueType,lv.DateTaken;

/*SQL Question - Normal (no diabetes): Less than 5.7%
Pre-diabetes: 5.7% up to but not including 6.5%
Diabetes: greater than or equal to 6.5% 
Use a case statement to categorize whether a test result for a patient is a
 ‘diabetes, pre-diabetes, or normal. Order your results by last name., first name and dateTaken*/

SELECT p.LastName,p.FirstName,lt.Name as 'name',lv.Value as 'value',lv.DateTaken as 'Date Taken',
CASE
WHEN lv.Value < 0.057 THEN 'Normal'
WHEN lv.Value > 0.057 AND lv.Value < 0.065 THEN 'Pre-diabetes'
ELSE 'Diabetes'
END as 'diabetes_status'
FROM labvalues as lv
JOIN patients as p
ON lv.Patient = p.PatientID
JOIN labvaluetypes as lt
ON lv.ValueType = lt.TypeID
WHERE name = 'mmol/mol (0.0xxx)'
ORDER BY LastName,FirstName,DateTaken;

