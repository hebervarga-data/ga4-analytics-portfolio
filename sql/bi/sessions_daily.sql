/*
EN:
BI model that creates daily sessions from GA4 events.
This table is used as a source for business KPIs and dashboards.

ES:
Modelo BI que crea sesiones diarias a partir de eventos GA4.
Esta tabla se utiliza como fuente para KPIs de negocio y dashboards.
*/

CREATE OR REPLACE TABLE bi.sessions_daily AS
SELECT
  DATE(TIMESTAMP_MICROS(event_timestamp)) AS date,
  COUNT(*) AS sessions
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'session_start'
GROUP BY date;
