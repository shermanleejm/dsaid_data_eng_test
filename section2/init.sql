create table if not exists cars (
    manufacturer TEXT not NULL,
    model_name TEXT NOT NULL,
    serial_number text NOT NULL,
    car_weight integer NOT NULL,
    price integer NOT NULL,
    primary key (manufacturer, model_name, serial_number)
);
CREATE TABLE IF NOT EXISTS sales (
    customer_name text NOT NULL,
    customer_phone text NOT NULL,
    salesperson text NOT NULL,
    serial_number text REFERENCES cars,
    primary key (
        customer_name,
        customer_phone,
        salesperson,
        serial_number
    )
);
