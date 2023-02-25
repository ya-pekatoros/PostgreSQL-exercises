CREATE TABLE employees (
    id bigint PRIMARY KEY,
    name varchar(255),
    last_name varchar(255),
    hire_date date,
    salary int,
    email varchar(255),
    manager_id int,
    department_id int,
    CONSTRAINT fk_manager
      FOREIGN KEY(manager_id) 
	    REFERENCES managers(id)
	        ON DELETE SET NULL,
    CONSTRAINT fk_department
      FOREIGN KEY(department_id) 
	    REFERENCES departments(id)
	        ON DELETE SET NULL;

CREATE TABLE departments (
    id bigint PRIMARY KEY,
    name varchar(255),
    location_id int,
    manager_id int,
    CONSTRAINT fk_location
      FOREIGN KEY(location_id) 
	    REFERENCES locations(id)
	        ON DELETE SET NULL,
    CONSTRAINT fk_manager
      FOREIGN KEY(manager_id) 
	    REFERENCES managers(id)
	        ON DELETE SET NULL;

CREATE TABLE locations (
    id bigint PRIMARY KEY,
    address varchar(255),
    region_id int,
    CONSTRAINT fk_region
      FOREIGN KEY(region_id) 
	    REFERENCES regions(id)
	        ON DELETE SET NULL;

CREATE TABLE regions (
    id bigint PRIMARY KEY,
    name varchar(255);
