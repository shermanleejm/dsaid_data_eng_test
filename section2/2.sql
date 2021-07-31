select manufacturer, count(manufacturer) sales_number
from sales
where extract(
        month
        from ts
    ) = extract(
        month
        from CURRENT_DATE
    )
group by manufacturer
order by sales_number;