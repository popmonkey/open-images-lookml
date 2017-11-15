view: annotations_bbox {
  sql_table_name: `bigquery-public-data.open_images.annotations_bbox`
    ;;

  dimension: confidence {
    type: number
    sql: ${TABLE}.confidence ;;
  }

  dimension: image_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.image_id ;;
  }

  dimension: is_depiction {
    type: yesno
    sql: ${TABLE}.is_depiction ;;
  }

  dimension: is_group_of {
    type: yesno
    sql: ${TABLE}.is_group_of ;;
  }

  dimension: is_inside {
    type: yesno
    sql: ${TABLE}.is_inside ;;
  }

  dimension: is_occluded {
    type: yesno
    sql: ${TABLE}.is_occluded ;;
  }

  dimension: is_truncated {
    type: yesno
    sql: ${TABLE}.is_truncated ;;
  }

  dimension: label_name {
    type: string
    sql: ${TABLE}.label_name ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: x_max {
    type: number
    sql: ${TABLE}.x_max ;;
  }

  dimension: x_min {
    type: number
    sql: ${TABLE}.x_min ;;
  }

  dimension: y_max {
    type: number
    sql: ${TABLE}.y_max ;;
  }

  dimension: y_min {
    type: number
    sql: ${TABLE}.y_min ;;
  }

  measure: count {
    type: count
    drill_fields: [label_name, images.image_id]
  }
}
