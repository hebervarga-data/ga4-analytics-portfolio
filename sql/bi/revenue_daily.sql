/*
EN:
BI model that creates daily revenue from GA4 purchase events.
Revenue is calculated using purchase_revenue.

ES:
Modelo BI que crea ingresos diarios a partir de eventos purchase de GA4.
El revenue se calcula usando purchase_revenue.
*/

CREATE OR REPLACE TABLE bi.revenue_daily AS
SELECT
  DATE(TIMESTAMP_MICROS(event_timestamp)) AS date,
  COUNT(*) AS orders,
  SUM(ecommerce.purchase_revenue) AS revenue
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase'
GROUP BY date
ORDER BY date;
