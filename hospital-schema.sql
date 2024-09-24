DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

CREATE TABLE Employees (
    Employee_ID VARCHAR(10) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(100),
    Phone_Number VARCHAR(20),
	Certification_Number VARCHAR(50) NOT NULL,
    PRIMARY KEY (Employee_ID));
    
CREATE TABLE Nurse (
    Nurse_ID VARCHAR(10) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Certification_Number VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    Phone_Number VARCHAR(20),
    PRIMARY KEY (Nurse_ID));
    
 CREATE TABLE Physician (
    Physician_ID VARCHAR(10) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Certification_Number VARCHAR(50) NOT NULL,
    Field_of_Expertise VARCHAR(100),
    Address VARCHAR(100),
    Phone_Number VARCHAR(20),
    PRIMARY KEY (Physician_ID));
    
    
	CREATE TABLE Room (
    Room_ID VARCHAR(100) NOT NULL,
    Capacity INT,
    Fee_Per_Night DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Room_ID));
    
    CREATE TABLE Patient (
    Patient_ID VARCHAR(100) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(100),
    Phone_Number VARCHAR(20),
    PRIMARY KEY (Patient_ID));
    
    
   CREATE TABLE Invoice(
   Invoice_ID VARCHAR(100) NOT NULL,
   Instruction_Fee DECIMAL(10, 2) NOT NULL,
   Room_Fee DECIMAL(10, 2) NOT NULL,
   PRIMARY KEY(Invoice_ID)
   );
    
    CREATE TABLE Instruction (
    Instruction_Code VARCHAR(100) NOT NULL,
    Description TEXT,
    Fee DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Instruction_Code)
   );
   
   CREATE TABLE Medication(
        Medication_Name VARCHAR(100),
		PRIMARY KEY (Medication_Name)
   );
    
    CREATE TABLE Pay (
    Invoice_ID VARCHAR(100) NOT NULL,
    Patient_ID VARCHAR(100) NOT NULL,
    Date DATE NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Invoice_ID,Patient_ID),
    FOREIGN KEY (Invoice_ID) REFERENCES Invoice(Invoice_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID));
    
    CREATE TABLE HealthRecord (
    Record_ID VARCHAR(100) NOT NULL,
    Patient_ID VARCHAR(100) NOT NULL,
    Disease VARCHAR(100) NOT NULL,
    Date DATE,
    Status VARCHAR(50),
    Description TEXT,
    PRIMARY KEY (Record_ID, Patient_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID));
    
    CREATE TABLE Hospitalized (
    Patient_ID VARCHAR(100) NOT NULL,
    Room_ID VARCHAR(100) NOT NULL,
    Number_of_Nights INT NOT NULL,
    PRIMARY KEY (Patient_ID, Room_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID));
    
    CREATE TABLE Monitor (
    Patient_ID VARCHAR(100) NOT NULL,
    Physician_ID VARCHAR(10) NOT NULL,
    Duration INT NOT NULL,
    PRIMARY KEY (Patient_ID, Physician_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Physician_ID) REFERENCES Physician(Physician_ID));
    
    CREATE TABLE Offer (
    Patient_ID VARCHAR(100) NOT NULL,
    Nurse_ID VARCHAR(10) NOT NULL,
    Medication_Name VARCHAR(100) NOT NULL,
    Amount_of_Medication DECIMAL(10, 2),
    Date date,
    PRIMARY KEY (Patient_ID, Nurse_ID, Medication_Name),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Nurse_ID) REFERENCES Nurse(Nurse_ID),
    FOREIGN KEY (Medication_Name) REFERENCES Medication(Medication_Name));

    
    CREATE TABLE Orders(
    Physician_ID VARCHAR(10) NOT NULL,
    Instruction_Code VARCHAR(100) NOT NULL,
    Patient_ID VARCHAR(100) NOT NULL,
    Date DATE NOT NULL,
    PRIMARY KEY (Physician_ID, Instruction_Code, Patient_ID),
    FOREIGN KEY (Physician_ID) REFERENCES Physician(Physician_ID),
    FOREIGN KEY (Instruction_Code) REFERENCES Instruction(Instruction_Code),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID));
   
    
    CREATE TABLE Execution (
    Instruction_Code VARCHAR(100) NOT NULL,
    Execution_Date DATE,
    Status VARCHAR(50),
    Nurse_ID VARCHAR(10) NOT NULL,
    Patient_ID VARCHAR(100) NOT NULL,
    PRIMARY KEY (Instruction_Code, Nurse_ID, Patient_ID),
    FOREIGN KEY (Instruction_Code) REFERENCES Instruction(Instruction_Code),
    FOREIGN KEY (Nurse_ID) REFERENCES Nurse(Nurse_ID),
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID));