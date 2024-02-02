use diabetes_prediction;
select * from diabetes;

# Q1. Retrieve the Patient_id and ages of all patients. 
select Patient_id, age from diabetes;

# Q2.  Select all female patients who are older than 40.
select * from diabetes
where gender="Female" and age>40;

# Q3. Calculate the average BMI of patients.
select avg(bmi)as Average_BMI from diabetes;

# Q4. List patients in descending order of blood glucose levels.
select * from diabetes 
order by  blood_glucose_level desc;

# Q5. Find patients who have hypertension and diabetes.
select * from diabetes 
where hypertension=1 and diabetes=1;

# Q6. Determine the number of patients with heart disease.
select count(Patient_id) from diabetes
where heart_disease=1;


# Q7. Group patients by smoking history and count how many smokers 
#     and nonsmokers there are.
select smoking_history, count(*) as Patients from diabetes 
group by smoking_history;

# Q8. Retrieve the Patient_ids of patients who have a BMI 
#     greater than the average BMI.
select Patient_id from diabetes 
where bmi> (select avg(bmi) from diabetes);

# Q9. Find the patient with the highest HbA1clevel and
#     the patient with the lowest HbA1clevel.
# for highest HbA1c_level
select * from diabetes
order by HbA1c_level desc
limit 1;
#for lowest HbA1c_level
select * from diabetes
order by HbA1c_level
limit 1;


# Q11. Rank patients by blood glucose level within each gender group.
select Patient_id, EmployeeName,blood_glucose_level,gender,
rank() over (partition by gender order by blood_glucose_level)
as Ranks from diabetes;

# Q12. Update the smoking history of patients who are older than 50 to "Ex-smoker."
UPDATE diabetes
SET smoking_history="Ex-Smoker"
where age > 50;

select * from diabetes;

# Q13  Insert a new patient into the database with sample data.
insert into diabetes (EmployeeName,Patient_id,gender,age,hypertension,heart_disease,smoking_history,
bmi,HbA1c_level,blood_glucose_level,diabetes) values 
("Prasad Nawale","PT8055","Male","22",0,0,"Smoking",27.02,6.2,145,1);


# Q14. Delete all patients with heart disease from the database.
delete from diabetes
where heart_disease=1;

select * from diabetes;

#  Q15.  Find patients who have hypertension but not diabetes using the EXCEPT operator.
   select * from diabetes where hypertension=1;
#  EXCEPT
  select * from diabetes where diabetes=1;

# Q16.Define a unique constraint on the "patient_id" column to ensure its values are unique.
create index patient_id_constraint on diabetes (Patient_id(255));

ALTER TABLE  diabetes
ADD constraint patient_id_constraint1 unique (Patient_id);
describe diabetes;


# Q17. Create a view that displays the Patient_ids, ages, and BMI of patients.
create view Diabetes1 as 
select * from diabetes;

select * from Diabetes1;


















