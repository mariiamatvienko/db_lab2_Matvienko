select volc_country, elevation from volcano join eruption using (volc_number)
   
select eruption_type, elevation FROM eruption_types join eruption using(eruption_id) where eruption_type <> 'Maar' 
union (SELECT eruption_type, max(elevation)
   FROM eruption_types join eruption using (eruption_id) 
   WHERE eruption_type IN (SELECT eruption_type
   FROM eruption_types join eruption using (eruption_id) 
   GROUP BY eruption_type
   HAVING COUNT(*) > 1)
   group by eruption_type)

select volc_country, count(volc_name) as volc_amount from volcano group by volc_country
