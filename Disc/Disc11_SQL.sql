--2. Creating Tables
--2.1
SELECT name FROM records WHERE supervisor = "Oliver Warbucks"; 
--2.2
SELECT name FROM records WHERE supervisor = name; 
--2.3
SELECT name FROM records WHERE salary > 50000 ORDER BY name; 

--3. Joins
--3.1
SELECT r.name, m.day, m.time FROM records as r, meetings as m 
    WHERE r.division = m.division and r.supervisor = "Oliver Warbucks"; 
--3.2
SELECT a.name, b.name FROM records as a, records as b
    WHERE a.supervisor = b.name and a.division != b.division; 
--3.3
CREATE TABLE helper33 as SELECT r.name, m.time FROM records as r, meetings as m WHERE r.division = m.division; 
SELECT a.name, b.name, b.time FROM helper33 as a, helper33 as b
    WHERE a.name > b.name and a.time = b.time; 

--4. Aggregation
--4.1
SELECT supervisor, SUM(Salary) FROM records GROUP BY supervisor; 
--4.2
CREATE TABLE helper42 as SELECT r.name, m.day FROM records as r, meetings as m WHERE r.division = m.division; 
SELECT day FROM helper42 GROUP BY day HAVING count(*) < 5; 
--4.3
SELECT a.division, a.name, b.name, a.salary + b.salary FROM records as a, records as b 
    WHERE a.name > b.name and a.salary + b.salary < 100000 and a.division = b.division; 

--5. Extra Questions
--5.1
CREATE TABLE num_taught as SELECT professor, course, count(*) as times FROM courses GROUP BY professor, course; 
--5.2
SELECT a.professor, b.professor, a.course FROM num_taught as a, num_taught as b 
    WHERE a.professor > b.professor and a.course = b.course and a.times = b.times; 
--5.3
SELECT a.professor, b.professor, a.course FROM courses as a, courses as b 
    WHERE a.professor > b.professor and a.course = b.course and a.semester = b.semester
    GROUP BY a.professor, b.professor HAVING count(*) > 1; 


