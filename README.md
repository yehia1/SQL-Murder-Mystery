# SQL-Murder-Mystery

You can check [Here](https://mystery.knightlab.com/?fbclid=IwAR2VNzwkN6O2A9r-I6eUNNKwYG6cCe7UTFRfJThDUVXEs6LxYTIcaSvlUD8)
## The Crime 

A crime has taken place and the detective needs your help. The detective gave you the crime scene report, but you somehow lost it. You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City​. Start by retrieving the corresponding crime scene report from the police department’s database.

## Explore the data base 
```sql 
SELECT name 
FROM sqlite_master
where type = 'table'
```
| name | 
| ----------- | 
| crime_scene_report |
| drivers_license |
| facebook_event_checkin |
| interview |
| get_fit_now_member |
| get_fit_now_check_in |
| solution |
| income |
| person |

### Schema  
![image](https://github.com/yehia1/SQL-Murder-Mystery/assets/44003515/a88d5cbf-ef13-4c73-a885-cf0c3a0a5436)

## [Solution](https://github.com/yehia1/SQL-Murder-Mystery/blob/main/SQL%20Murder%20Solution%20.sql)
The queries used in the solution.sql goes step by steps using queries and subqueries and ctes to check for 
the persons in tables to finally reach the crime murdrer and the main villian behind the crime 

Hope you enjoy solving it :) 
