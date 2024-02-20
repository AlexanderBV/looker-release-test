view: trips {
  sql_table_name: oss_release_dev.trips ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: avz_uuid {
    type: string
    sql: ${TABLE}.avz_uuid ;;
  }
  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_date ;;
  }
  dimension_group: expected_date_finish {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expected_date_finish ;;
  }
  dimension_group: expected_date_init {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expected_date_init ;;
  }
  dimension: extra_data {
    type: string
    sql: ${TABLE}.extra_data ;;
  }
  dimension: interval_data {
    type: string
    sql: ${TABLE}.interval_data ;;
  }
  dimension: is_locked {
    type: yesno
    sql: ${TABLE}.is_locked ;;
  }
  dimension_group: manipulated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.manipulated_at ;;
  }
  dimension: metadata {
    type: string
    sql: ${TABLE}.metadata ;;
  }
  dimension: order_cf_batch_id {
    type: number
    sql: ${TABLE}.order_cf_batch_id ;;
  }
  dimension: requirement_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.requirement_id ;;
  }
  dimension: route_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.route_id ;;
  }
  dimension: route_plan_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.route_plan_id ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.start_date ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: subsidiary_id {
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }
  dimension: user_manipulated_id {
    type: number
    sql: ${TABLE}.user_manipulated_id ;;
  }
  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: trip_duration_hours {
    type: number
    sql: ROUND(TIME_TO_SEC(TIMEDIFF(${end_raw}, ${start_raw})) / 3600, 2) ;;
    value_format_name: decimal_2
    label: "Duración del viaje (horas)"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_distance {
    type: sum
    sql: ${TABLE}.distance ;;
    value_format_name: decimal_2
    label: "Total distancia"
  }

  measure: average_distance {
    type: average
    sql: ${distance} ;;
    value_format_name: decimal_2
    label: "Promedio distancia"
  }

  measure: total_trip_duration_hours {
    type: sum
    sql: ROUND(TIME_TO_SEC(TIMEDIFF(${end_raw}, ${start_raw})) / 3600, 2) ;;
    value_format_name: decimal_2
    label: "Total de horas de viaje"
  }

  measure: average_trip_duration_hours {
    type: average
    sql: TIME_TO_SEC(TIMEDIFF(${end_raw}, ${start_raw})) / 3600 ;;
    value_format_name: decimal_2
    label: "Promedio de horas de viaje"
  }

  measure: min_trip_duration_hours {
    type: min
    sql: TIME_TO_SEC(TIMEDIFF(${end_raw}, ${start_raw})) / 3600 ;;
    value_format_name: decimal_2
    label: "Minimo de horas de viaje"
  }

  measure: max_trip_duration_hours {
    type: max
    sql: TIME_TO_SEC(TIMEDIFF(${end_raw}, ${start_raw})) / 3600 ;;
    value_format_name: decimal_2
    label: "Maximo de horas de viaje"
  }
}
