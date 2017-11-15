connection: "lookerdata_publicdata_standard_sql"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: open_images_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: open_images_default_datagroup

explore: annotations_bbox {
  join: images {
    sql_on: ${annotations_bbox.image_id} = ${images.image_id} ;;
    relationship: many_to_one
  }
}

explore: dict {
  join: labels {
    sql_on: ${labels.label_name} = ${dict.label_name} ;;
    relationship: one_to_one
  }
}

explore: images {
  join: labels {
    sql_on: ${images.image_id} = ${labels.image_id} ;;
    relationship: one_to_many
  }
  join: dict {
    sql_on: ${labels.label_name} = ${dict.label_name} ;;
    relationship: one_to_many
  }
}

explore: labels {
  join: images {
    sql_on: ${labels.image_id} = ${images.image_id} ;;
    relationship: many_to_one
  }
  join: dict {
    sql_on: ${dict.label_name} = ${labels.label_name} ;;
    relationship: one_to_one
  }
}
