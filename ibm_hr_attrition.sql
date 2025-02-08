select * from hrcleaned;

# How many employees left
SELECT 
    COUNT(*) AS Total_left
FROM
    hrcleaned
WHERE
    Attrition = 1;
    
    
# What is the Average Age of Employees Who Left the Company?
SELECT 
    ROUND(AVG(Age), 2) AS Avg_Age_Attrition
FROM
    hrcleaned
WHERE
    Attrition = 1;


# What is the Most Common Department for Employees Who Left?
SELECT 
    Department, COUNT(*) AS Employees_left
FROM
    hrcleaned
WHERE
    Attrition = 1
GROUP BY Department
ORDER BY Employees_left
LIMIT 1;


# What is the Correlation Between Salary and Attrition?

CREATE VIEW Attirition_by_salary AS
    SELECT 
        CASE
            WHEN monthlyincome < 3000 THEN 'Low Income (<3K)'
            WHEN monthlyincome BETWEEN 3000 AND 7000 THEN 'Medium Income (3K - 7K)'
            WHEN monthlyincome > 7000 THEN 'High Income (>7K)'
        END AS Salary_Range,
        COUNT(*) AS Total_employees,
        SUM(attrition) AS Employee_left,
        (SUM(Attrition) / COUNT(*)) * 100 AS Attrition_Rate
    FROM
        hrcleaned
    GROUP BY Salary_Range
    ORDER BY Attrition_Rate DESC;
    
    
# What is the Correlation Between Years of Experience and Attrition?
SELECT 
    yearsatcompany,
    COUNT(*) AS Total_Employees,
    SUM(Attrition) AS Employees_left,
    (SUM(Attrition) / COUNT(*)) * 100 AS Attrition_Rate
FROM
    hrcleaned
GROUP BY yearsatcompany
ORDER BY yearsatcompany;


# Difference in Attrition Rates Between Men and Women?
SELECT 
    gender,
    COUNT(*) AS Total_Employees,
    SUM(Attrition) AS Employees_left,
    (SUM(Attrition) / COUNT(*)) * 100 AS Attrition_Rate
FROM
    hrcleaned
GROUP BY gender;


# Difference in Attrition Rates Between Different Departments
CREATE VIEW Attrition_by_department AS
    SELECT 
        Department,
        COUNT(*) AS Total_Employees,
        SUM(Attrition) AS Employees_left,
        (SUM(Attrition) / COUNT(*)) * 100 AS Attrition_Rate
    FROM
        hrcleaned
    GROUP BY Department
    ORDER BY Attrition_Rate DESC;
    
    
# Work-Life Balance vs. Attrition
SELECT WorkLifeBalance, 
       COUNT(*) AS Total_Employees, 
       SUM(Attrition) AS Employees_Left, 
       (SUM(Attrition) / COUNT(*)) * 100 AS Attrition_Rate
FROM hrcleaned
GROUP BY WorkLifeBalance 
ORDER BY WorkLifeBalance;

# Impact of Overtime on Attrition
SELECT OverTime, 
       COUNT(*) AS Total_Employees, 
       SUM(Attrition) AS Employees_Left, 
       (SUM(Attrition) / COUNT(*)) * 100 AS Attrition_Rate
FROM hrcleaned 
GROUP BY OverTime;


# Education Level vs. Attrition
CREATE VIEW Attrition_by_education AS
    SELECT 
        education,
        COUNT(*) AS Total_Employees,
        SUM(Attrition) AS Employees_left,
        (SUM(attrition) / COUNT(*)) * 100 AS Attrition_Rate
    FROM
        hrcleaned
    GROUP BY Education
    ORDER BY Attrition_Rate DESC;








    





