view: labels {
  sql_table_name: `bigquery-public-data.open_images.labels`
    ;;

  dimension: confidence {
    type: number
    sql: ${TABLE}.confidence ;;
  }

  dimension: confidence_tier {
    type: tier
    tiers: [0,0.25,0.5,0.7,0.8,0.9,1]
    sql: ${confidence} ;;
  }

  dimension: image_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.image_id ;;
  }

  dimension: label_name {
    type: string
    sql: ${TABLE}.label_name ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  measure: count {
    type: count
    drill_fields: [label_name, images.image_id]
  }
}
