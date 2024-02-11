SELECT * FROM crime_scene_report
WHERE city = 'SQL City' AND type = 'murder'AND date = '20180115';

/* 
Security footage shows that there were 2 witnesses.#
The first witness lives at the last house on "Northwestern Dr".
The second witness, named Annabel, lives somewhere on "Franklin Ave".
*/

SELECT * FROM person
Where address_street_name = "Northwestern Dr"
AND address_number = (SELECT max(address_number) from person
Where address_street_name = "Northwestern Dr");

SELECT * FROM person 
WHERE address_street_name = "Franklin Ave" AND name like "Annabel%";

/* 
Morty Schapiro 14887 118009 111564949
Annabel Miller 16371 490173 318771143 
*/

SELECT * FROM interview
where person_id in (16371,14887);

/* 
I heard a gunshot and then saw a man run out.
He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z".
Only gold members have those bags.
The man got into a car with a plate that included "H42W".

I saw the murder happen,
and I recognized the killer from my gym when I was working out last week on January the 9th.
*/


SELECT * FROM get_fit_now_member 
where membership_status = 'gold';


with annabella_check_in_time as 
	(SELECT * FROM get_fit_now_check_in 
	Where check_in_date = 20180109
	and membership_id = (Select id from get_fit_now_member where person_id = 16371)),

members_with_annabela as (
select * from get_fit_now_check_in 
where check_out_time > (select check_in_time from annabella_check_in_time) 
		and check_in_time < (select check_out_time from annabella_check_in_time)),
  
suspects as (
SELECT * FROM get_fit_now_member 
where membership_status = 'gold' and id in (select membership_id from members_with_annabela)),

suspect_ids as (
Select * from person 
where id in (select person_id from suspects))

SELECT p.* FROM person p
inner join drivers_license d
on p.license_id = d.id
where d.plate_number like '%H42W%' and d.id in (select license_id from suspect_ids);


/*
First murder: Jeremy Bowers 67318
*/

Select * from interview 
Where person_id = 67318;

/*
I was hired by a woman with a lot of money.
I don't know her name but I know she's around 5'5" (65") or 5'7" (67").
She has red hair and she drives a Tesla Model S.
I know that she attended the SQL Symphony Concert 3 times in December 2017.
*/


with villans_ids as (
Select P.* from person p
inner join drivers_license d 
on p.license_id = d.id
where hair_color = 'red' and gender = 'female' and height between 65 and 67
and car_make = 'Tesla' and car_model = "Model S")


select p.* from person p
inner join facebook_event_checkin f
on p.id = f.person_id
Where date between 20171201 and 20171231 and event_name = 'SQL Symphony Concert'
and person_id in (SELECT id from villans_ids);


-- main_villian is Miranda Priestly 99716
