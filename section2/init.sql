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
    manufacturer text,
    model_name text,
    serial_number text,
    ts TIMESTAMP,
    primary key (
        customer_name,
        customer_phone,
        salesperson,
        serial_number,
        manufacturer,
        model_name
    ),
    foreign key (manufacturer, model_name, serial_number) references cars(manufacturer, model_name, serial_number) on delete cascade
);
insert into cars (
        manufacturer,
        model_name,
        serial_number,
        car_weight,
        price
    )
values ('honda', 'civic', '12345a', 6, 130000),
    ('honda', 'civic', '12345b', 600, 130000),
    ('honda', 'civic', '12345c', 600, 130000),
    ('mitsubishi', 'lancer', '12345a', 600, 130000),
    ('mitsubishi', 'lancer', '12345b', 600, 130000),
    ('mitsubishi', 'lancer', '12345c', 600, 130000);
insert into sales (
        customer_name,
        customer_phone,
        salesperson,
        serial_number,
        manufacturer,
        model_name
    )
values (
        'John',
        '999',
        'Mary',
        '12345a',
        'honda',
        'civic',
        '2021-07-31 12:56:00-00'
    ),
    (
        'Jacob',
        '995',
        'Mary',
        '12345a',
        'mitsubishi',
        'lancer',
        '2021-07-30 12:56:00-00'
    ),
    (
        'Jacob',
        '995',
        'Mary',
        '12345b',
        'mitsubishi',
        'lancer',
        '2021-08-03 12:56:00-00'
    ),
(
        'Jacob',
        '995',
        'Mary',
        '12345c',
        'mitsubishi',
        'lancer',
        '2021-08-04 12:56:00-00'
    );