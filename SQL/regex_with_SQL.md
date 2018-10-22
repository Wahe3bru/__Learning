I did not know you could do this.

This query shows stations that don't start and end in vowels.
```
select city from station
where left(city,1) not regexp 'a|e|i|o|u' and right(city,1) not regexp 'a|e|i|o|u' group by city
```
