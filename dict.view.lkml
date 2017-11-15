view: dict {
  sql_table_name: `bigquery-public-data.open_images.dict`
    ;;

  dimension: label_display_name {
    primary_key: yes
    type: string
    sql: ${TABLE}.label_display_name ;;
    link: {
      url: "/dashboards/86?keyword={{value}}"
      label: "Keyword Dashboard"
    }

  }

  dimension: label_name {
    type: string
    sql: ${TABLE}.label_name ;;
  }

  measure: count {
    type: count
    drill_fields: [label_display_name, label_name]
  }
}
