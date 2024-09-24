INSERT INTO Employees (Employee_ID, Name, Certification_Number, Address, Phone_Number) VALUES
('01', 'Wanda Maximoff', 'CERT201','34 Westview Avenue', '555-4321'),
('02', 'Sam Wilson', 'CERT202', '58 Falcon Lane', '555-8765'),
('03', 'Shuri', 'CERT203', '789 Wakanda Boulevard', '555-2109'),
('04', 'Peter Parker', 'CERT204', '20 Queens Road', '555-6543'),
('05', 'Scott Lang', 'CERT205', '12 Ant Hill', '555-0987'),
('11', 'Stephen Strange', 'CERT001', '177A Bleecker Street', '555-1122'),
('12', 'T’Challa', 'CERT002', '789 Wakanda Boulevard', '555-3344'),
('13', 'Carol Danvers', 'CERT003', '789 Stellar Avenue', '555-5566'),
('14', 'Bruce Banner', 'CERT004',  '177A Bleecker Street', '555-7788'),
('15', 'Thor Odinson', 'CERT005', '1 Valhalla', '555-9900');


INSERT INTO Nurse (Nurse_ID, Name, Certification_Number, Address, Phone_Number) VALUES
('01', 'Wanda Maximoff', 'CERT201','34 Westview Avenue', '555-4321'),
('02', 'Sam Wilson', 'CERT202', '58 Falcon Lane', '555-8765'),
('03', 'Shuri', 'CERT203', '789 Wakanda Boulevard', '555-2109'),
('04', 'Peter Parker', 'CERT204', '20 Queens Road', '555-6543'),
('05', 'Scott Lang', 'CERT205', '12 Ant Hill', '555-0987');


INSERT INTO Physician (Physician_ID, Name, Certification_Number, Field_of_Expertise, Address, Phone_Number) VALUES
('11', 'Stephen Strange', 'CERT001', 'Neurology', '177A Bleecker Street', '555-1122'),
('12', 'T’Challa', 'CERT002', 'General Medicine', '789 Wakanda Boulevard', '555-3344'),
('13', 'Carol Danvers', 'CERT003', 'Pediatrics', '789 Stellar Avenue', '555-5566'),
('14', 'Bruce Banner', 'CERT004', 'Radiation Therapy', '177A Bleecker Street', '555-7788'),
('15', 'Thor Odinson', 'CERT005', 'Orthopedics', '1 Valhalla', '555-9900');





INSERT INTO Room (Room_ID, Capacity, Fee_Per_Night) VALUES
('R1', 1, 80.00),
('R2', 2, 120.00),
('R3', 3, 160.00),
('R4', 4, 200.00),
('R5', 5, 250.00);


INSERT INTO Patient (Patient_ID, Name, Address, Phone_Number) VALUES
('PT1', 'Nick Fury', '23 Shield Street', '555-2233'),
('PT2', 'Pepper Potts', '10880 Malibu Point', '555-4455'),
('PT3', 'Jane Foster', '23 Elm Drive', '555-6677'),
('PT4', 'Maria Hill', '45 Security Way', '555-8899'),
('PT5', 'Phil Coulson', '98 Level One', '555-1010');

INSERT INTO Invoice(Invoice_ID, Instruction_Fee, Room_Fee) VALUES
('ABC-123-EFG',1000.00,560.00),
('CBA-345-OPQ',150.00,360.00),
('BCA-567-PQO',500.00,800.00),
('DEF-567-GH',2500.00,2000.00),
('EDF-567-QP',3000.00,2000.00);




INSERT INTO Instruction (Instruction_Code, Description, Fee) VALUES
('NE', 'Neurological Examination', 1000.00),
('GC', 'General Checkup', 150.00),
('PC', 'Pediatric Consultation', 500.00),
('RT', 'Radiation Treatment', 2500.00),
('OS', 'Orthopedic Surgery', 3000.00);


INSERT INTO Pay (Invoice_ID, Date, Total_Amount, Patient_ID) VALUES
('ABC-123-EFG', '2024-01-10', 1560.00, 'PT1'),
('CBA-345-OPQ', '2024-02-15', 510.00, 'PT2'),
('BCA-567-PQO', '2024-03-20', 1300.00, 'PT3'),
('DEF-567-GH', '2024-04-25', 4500.00, 'PT4'),
('EDF-567-QP', '2024-05-30', 5000.00, 'PT5');  

INSERT INTO Medication(Medication_Name ) VALUES
('Ibuprofen'),
('Amoxicillin'),
('Ventolin'),
('Morphine'),
('Hydrocortisone');



INSERT INTO HealthRecord (Record_ID, Patient_ID, Disease, Date, Status, Description) VALUES
('R1', 'PT1', 'Brain Injury', '2024-01-01', 'Recovering', 'Neurological examination post-battle.'),
('R2', 'PT2', 'General Illness', '2024-02-10', 'Stable', 'Routine checkup.'),
('R3', 'PT3', 'Asthma', '2024-03-15', 'Under Control', 'Pediatric consultation for asthma management.'),
('R4', 'PT4', 'Radiation Poisoning', '2024-04-20', 'Under Treatment', 'Radiation treatment after exposure.'),
('R5', 'PT5', 'Fracture', '2024-05-25', 'Healing', 'Orthopedic surgery for arm fracture.');




INSERT INTO Hospitalized (Patient_ID, Room_ID, Number_of_Nights) VALUES
('PT1', 'R1', 7),
('PT2', 'R2', 3),
('PT3', 'R3', 5),
('PT4', 'R4', 10),
('PT5', 'R5', 8);


    


INSERT INTO Monitor (Patient_ID, Physician_ID, Duration) VALUES
('PT1', '11', 10),
('PT2', '12', 3),
('PT3', '13', 5),
('PT4', '14', 8),
('PT5', '15', 15);




INSERT INTO Offer (Patient_ID, Nurse_ID, Medication_Name, Amount_of_Medication,date) VALUES
('PT1', '01', 'Ibuprofen', 100.00, '2024-01-01'),
('PT2', '02', 'Amoxicillin', 200.00, '2024-02-10'),
('PT3', '03', 'Ventolin', 150.00,'2024-03-15' ),
('PT4', '04', 'Morphine', 300.00, '2024-04-20'),
('PT5', '05', 'Hydrocortisone', 250.00, '2024-05-25');


INSERT INTO Orders (Physician_ID, Patient_ID, Instruction_Code, Date) VALUES
('11','PT1','NE', '2024-01-02'),
('12', 'PT2','GC', '2024-02-11'),
('13', 'PT3','PC', '2024-03-16'),
('14', 'PT4','RT', '2024-04-21'),
('15', 'PT5','OS', '2024-05-26');


INSERT INTO Execution (Instruction_Code, Execution_Date, Status, Nurse_ID,Patient_ID) VALUES
('NE', '2024-01-03', 'Completed', '01','PT1'),
('GC', '2024-02-12', 'Completed', '02','PT2'),
('PC', '2024-03-17', 'Completed', '03','PT3'),
('RT', '2024-04-22', 'Pending', '04','PT4'),
('OS', '2024-05-27', 'Pending', '05','PT5');