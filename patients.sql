use hospital_database;
select * from patients;
insert into patients
values(1, 'patient', 'a', 'place_a', '2022-01-01', 'male' ),
	(last_insert_id(), 'patient', 'b', 'place_b', '2022-01-01', 'female'),
    (last_insert_id(), 'patient', 'c' , 'place_a', '2022-02-01', 'male'),
    (last_insert_id(), 'patient', 'd', 'place_b',  '2022-01-01', 'male'),
    (last_insert_id(), 'patient', 'e', 'place_c',  '2022-01-04', 'female'),
    (last_insert_id(), 'patient', 'f', 'place_c',  '2022-01-05', 'male'),
    (last_insert_id(), 'patient', 'g', 'place_a', '2022-01-01', 'female'),
    (last_insert_id(), 'patient', 'h', 'place_d', '2022-01-01', 'male'),
    (last_insert_id(), 'patient', 'i', 'place_d', '2022-01-01','male'),
    (last_insert_id(), 'patient', 'j', 'place_a', '2022-01-01', 'male'),
    (last_insert_id(), 'patient', 'k', 'place_c', '2022-01-01', 'female'),
    (last_insert_id(), 'patient', 'l','place_b',  '2022-01-01', 'male');
select * from patients;
select * from doctors;
-- Inserting into doctors table
insert into doctors
values(1, 'doctor',1),
	(2, 'doctor', 'a'),
    (3, 'doctor', 'b'),
    (4,'doctor', 'c'),
    (5,'doctor','d');
update doctors
set last_name ='e'
where doctor_id =1;
select * from admissions;
-- inserting into admissions table
insert into admissions
values('2022-01-01', 2000, 1, 1),
	('2022-01-01', 4500, 2,1),
    ('2022-01-04', 5000, 3, 1),
    ('2022-01-01', 3000, 4,2),
    ('2022-02-01', 2500, 5, 2),
    ('2022-03-01',3000, 7, 2),
    ('2022-03-02', 1500, 6,2);
select * from admissions
    


