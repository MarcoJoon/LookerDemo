view: users {
  sql_table_name: "PUBLIC"."USERS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: full_name {
    type: string
    sql: ${first_name} || ' ' || ${last_name};;
  }

  dimension: age {
    type: number
    sql: ${TABLE}."AGE" ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [0,20,30,40,50,60,70,80]
    style: integer
    sql: ${age} ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }


  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}."TRAFFIC_SOURCE" ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}."ZIP" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name]
  }

  measure: female_count {
    type: count
    filters: {
      field: gender
      value: "female"
    }
  }
}
