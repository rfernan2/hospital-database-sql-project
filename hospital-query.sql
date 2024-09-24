-- Q1: List all the names of physicians and patient they are monitoring
Select Physician.name as Physician_Name, Patient.name as Patient_Name
From Monitor
Join Physician 
On Monitor.Physician_ID = Physician.Physician_ID
Join Patient 
On Monitor.Patient_ID = Patient.Patient_ID;

-- Q2: List all the names of nurses they are executing instructions for patients
Select Nurse.name as Nurse_Name
From Execution
Join Nurse
On Execution.Nurse_ID = Nurse.Nurse_ID;

-- Q3: List the names of medications given to the patient with the ID 'PT2'
Select Medication.Medication_Name as Medication_Name
From Offer
Join Medication
On Offer.Medication_Name = Medication.Medication_Name
Join Patient
On Offer.Patient_ID = Patient.Patient_ID
Where Offer.Patient_ID = 'PT2';

-- Q4: List the total amount of payment each patient has made 
Select Pay.Patient_ID as Patient_ID, SUM(Pay.Total_Amount) as Total_Amount 
FROM Pay
Group by Pay.Patient_ID;

-- Q5: List the total amount of each invoice using Instruction_Fee + Room_Fee
Select Invoice.Invoice_ID, (SUM(Instruction_Fee) + SUM(Room_Fee)) AS Total_Amount
From Invoice
Group by Invoice.Invoice_ID;

-- Q6: List the amount of room fee each patient has paid using Number_of_Nights * Fee_Per_Night
Select Hospitalized.Patient_ID, SUM(Hospitalized.Number_of_Nights * Room.Fee_Per_Night) as Total_Room_Fee
From Hospitalized
Join Room
On Hospitalized.Room_ID = Room.Room_ID
Group by Hospitalized.Patient_ID;

-- Q7: List the names of patients whose total amount of payment is above 2000.00
Select Patient.Name
From Patient
Where Patient.Patient_ID in
(
Select Pay.Patient_ID
From Pay
Where Pay.Total_Amount > 2000.00
);

-- Q8: List the names of patients whose number of nights is above 5
Select Patient.Name
From Patient
Where Patient.Patient_ID in(
Select Hospitalized.Patient_ID
From Hospitalized
Where Hospitalized.Number_of_Nights > 5
);

-- Q9: List the names of patients whose instruction fee is under 1000.00
Select Patient.Name
From Patient
Where Patient.Patient_ID in(
Select Orders.Patient_ID
From Orders
Where Orders.Instruction_Code in (
Select Instruction.Instruction_Code
From Instruction
Where Instruction.Fee < 1000.00
)
);

-- Q10: List the name of nurse who offers Ibuprofen to patient 
Select Nurse.Name as Nurse_Name
From Nurse
Join Offer
On Nurse.Nurse_ID = Offer.Nurse_ID
Where Offer.Medication_Name = 'Ibuprofen'; 

-- Q11: List the name of physician who orders instruction code 'NE' to patient
Select Physician.Name
From Physician
Join Orders
On Physician.Physician_ID = Orders.Physician_ID
Where Orders.Instruction_Code = 'NE';

-- Q12: Calculate the average fee of instructions
Select AVG(Instruction.Fee) as Average_Instruction_Fee
From Instruction;


-- Q13: Calculate the average room fee paid by patients using Number_of_Nights * Fee_Per_Night
Select AVG(Hospitalized.Number_of_Nights * Room.Fee_Per_Night) As Average_Room_Payment
From Hospitalized
Join Room
On Hospitalized.Room_ID = Room.Room_ID;

-- Q14: List the names of patients whose duration is less than 7
Select Patient.Name
From Patient
Join Monitor 
On Patient.Patient_ID = Monitor.Patient_ID
Where Monitor.Duration < 7;

-- Q15: Find the status of execution where patient ID is 'PT1', nurse ID is '01' and the instruction code is 'NE'
Select Status
From Execution
Where Execution.Patient_ID = 'PT1' and Execution.Nurse_ID = '01' and Execution.Instruction_Code = 'NE';

-- View 1
-- Description: This view provides total payment of each patient with name and id.
Create view patient_payment as
Select Pay.Patient_ID, Patient.Name, SUM(Pay.Total_Amount) as Total_Payment
From Pay
Join Patient
On Pay.Patient_ID  = Patient.Patient_ID
Group by Pay.Patient_ID;
-- Discussion: This view provides total payment of each patient. It is useful for quickly retrieving the financial information of patients.
-- tesing view 1
Select *
From patient_payment;

-- View 2
-- Description: This view provides medication that each patient is taking
Create view patient_medication as
Select Offer.Patient_ID, Patient.Name as Patient_Name, Offer.Medication_Name
From Patient 
Join Offer
On Patient.Patient_ID = Offer.Patient_ID;
-- Discussion: This view provides medication that each patient is taking, it is useful to retrieving the medication information of each patient.
-- testing view 2
Select *
From patient_medication;

-- View 3
-- Description: This view provides the diseases and status of each patient
Create view patient_status as
Select HealthRecord.Patient_ID, Patient.name, HealthRecord.Disease,HealthRecord.Status
From Patient
Join HealthRecord
On Patient.Patient_ID = HealthRecord.Patient_ID;
-- Discussion: This view provides the diseases and status of each patient, it is useful to quickly know each patient's ongoing treatment
-- testing view 3
Select *
From patient_status;
