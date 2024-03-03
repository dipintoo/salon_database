-- Tabel Customers
CREATE TABLE customers(
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(20) UNIQUE NOT NULL,
  name VARCHAR(50) NOT NULL
);

-- Tabel Services
CREATE TABLE services(
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

-- Tabel Appointments
CREATE TABLE appointments(
  apppointment_id SERIAL PRIMARY KEY,
  time VARCHAR(20) NOT NULL,
  customer_id INTEGER FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
  service_id INTEGER FOREIGN KEY(service_id) REFERENCES services(service_id)
);

-- Input Data
INSERT INTO services(service_id, name) 
  VALUES(1, 'cut'),(2,'color'),(3, 'perm'),(4,'style'),(5,'trim');
