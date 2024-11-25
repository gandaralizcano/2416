view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;

  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    html:
    {% if state._value == "California" %}
    <img src="https://www.istockphoto.com/photo/cute-ginger-cat-gm1443562748-482502032" height="170" width="255">
    {% elsif state._value == "New York" %}
    <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fpuppy&psig=AOvVaw1-BVLwykaYjUIUoz9r-seL&ust=1732609575005000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCNiq4uOH94kDFQAAAAAdAAAAABAE" height="170" width="255">
    {% elsif state._value == "Colorado" %}
    <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fstock.adobe.com%2Fsearch%3Fk%3Dmonkey&psig=AOvVaw3iMnWkioEThERVE2Wm6BHq&ust=1732609595880000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMiE-POH94kDFQAAAAAdAAAAABAE" height="170" width="255">
    {% elsif state._value == "Illinois"%}
    <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Fcute-ant&psig=AOvVaw1-CwoTB56-DjI_454Es6l5&ust=1732609629288000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLi1hv2H94kDFQAAAAAdAAAAABAE" height="170" width="255">
    {% else %}
    <p>No Image Added</p>
    {% endif %} ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  first_name,
  last_name,
  events.count,
  orders.count,
  saralooker.count,
  sindhu.count,
  user_data.count
  ]
  }

}
