/*
EN:
BI funnel model built from GA4 events.
Event-based funnel aggregated by day.

ES:
Modelo BI de funnel construido a partir de eventos GA4.
Funnel basado en eventos y agregado por día.
*/

CREATE OR REPLACE TABLE bi.funnel_daily AS
SELECT
  DATE(TIMESTAMP_MICROS(event_timestamp)) AS date,

  COUNTIF(event_name = 'view_item') AS product_views,
  COUNTIF(event_name = 'add_to_cart') AS add_to_cart,
  COUNTIF(event_name = 'begin_checkout') AS checkout,
  COUNTIF(event_name = 'purchase') AS purchases

FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY date
ORDER BY date;
