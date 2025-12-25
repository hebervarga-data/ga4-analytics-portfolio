/*
EN:
BI model that creates daily conversions from GA4 events.
A conversion is defined as a 'purchase' event.

ES:
Modelo BI que crea conversiones diarias a partir de eventos GA4.
Una conversión se define como el evento 'purchase'.
*/

CREATE OR REPLACE TABLE bi.conversions_daily AS
SELECT
  DATE(TIMESTAMP_MICROS(event_timestamp)) AS date,
  COUNT(*) AS conversions
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase'
GROUP BY date;
