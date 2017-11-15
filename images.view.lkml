view: images {
  sql_table_name: `bigquery-public-data.open_images.images`
    ;;

  dimension: image_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.image_id ;;
  }

  dimension: author {
    type: string
    sql: ${TABLE}.author ;;
    link: {
      url: "/explore/open_images/images?fields=images.thumbnail&f[images.author]={{value}}&limit=10"
      label: "Author Images"
    }
  }

  dimension: author_profile_url {
    type: string
    sql: ${TABLE}.author_profile_url ;;
  }

  dimension: license {
    type: string
    sql: ${TABLE}.license ;;
  }

  dimension: original_landing_url {
    type: string
    sql: ${TABLE}.original_landing_url ;;
  }

  dimension: original_md5 {
    type: string
    sql: ${TABLE}.original_md5 ;;
  }

  dimension: original_size {
    type: number
    sql: ${TABLE}.original_size ;;
  }

  dimension: original_url {
    type: string
    sql: ${TABLE}.original_url ;;
  }

  dimension: subset {
    type: string
    sql: ${TABLE}.subset ;;
  }

  dimension: thumbnail_300k_url {
    type: string
    sql: ${TABLE}.thumbnail_300k_url ;;
  }

  dimension: thumbnail {
    sql: ${thumbnail_300k_url} ;;
    html: <div>{{ title._value }}<br/><img src="{{ value }}" width=200/></a></div> ;;
    link: {
      label: "Image Dash"
      url: "/dashboards/85?image_id={{image_id._value}}"
    }
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [image_id, annotations_bbox.count, labels.count]
  }
}
