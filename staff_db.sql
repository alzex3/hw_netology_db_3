CREATE TABLE employee (
    employee_id SERIAL      PRIMARY KEY,
    first_name  VARCHAR(20) NOT NULL,
    dept        VARCHAR(20) NOT NULL,
    boss_id     INTEGER     REFERENCES employee(employee_id)
);
