select customer_name,
    (
        select sum(cars.price)
        from cars
        where cars.manufacturer = sales.manufacturer
            and cars.model_name = sales.model_name
            and cars.serial_number = sales.serial_number
    ) spending
from sales;