- 1. Display all facilities
SELECT * FROM facilities;

-- 2. Display all inspections
SELECT * FROM inspections;

-- 3. Display all complaints
SELECT * FROM complaints;

-- 4. Find facilities with their inspection details
SELECT
    f.name AS facility_name,
    i.cleanliness_score,
    i.odor_score,
    i.waste_level,
    i.hygiene_score
FROM facilities f
JOIN inspections i
ON f.id = i.facility_id;

-- 5. Count inspections for each facility
SELECT
    f.name AS facility_name,
    COUNT(i.id) AS total_inspections
FROM facilities f
LEFT JOIN inspections i
ON f.id = i.facility_id
GROUP BY f.id, f.name;

-- 6. Display pending complaints
SELECT *
FROM complaints
WHERE status = 'Pending';

-- 7. Count complaints for each facility
SELECT
    f.name AS facility_name,
    COUNT(c.id) AS total_complaints
FROM facilities f
LEFT JOIN complaints c
ON f.id = c.facility_id
GROUP BY f.id, f.name;

-- 8. Display facilities with hygiene score below 50
SELECT
    f.name AS facility_name,
    i.hygiene_score
FROM facilities f
JOIN inspections i
ON f.id = i.facility_id
WHERE i.hygiene_score < 50;