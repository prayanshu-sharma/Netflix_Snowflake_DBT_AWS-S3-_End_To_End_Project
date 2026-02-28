{% set congigs = [
    {
        "table" : ref('bronze_titles'),
        "columns" : "silver_titles.*",
        "alias" : "silver_titles"
    },
    { 
        "table" : ref('bronze_category'),
        "columns" : "silver_category.LISTED_IN",
        "alias" : "silver_category",
        "join_condition" : "silver_category.show_id = silver_titles.show_id"
    },
    {
        "table" : ref('bronze_countries'),
        "columns" : "silver_countries.COUNTRY",
        "alias" : "silver_countries",
        "join_condition" : "silver_countries.show_id = silver_titles.show_id"
    },
    {
        "table" : ref('bronze_directors'),
        "columns" : "silver_directors.DIRECTOR",
        "alias" : "silver_directors",
        "join_condition" : "silver_directors.show_id = silver_titles.show_id"
    },
    {
        "table" : ref('bronze_cast'),
        "columns" : "silver_cast.CAST",
        "alias" : "silver_cast",
        "join_condition" : "silver_cast.show_id = silver_titles.show_id"
    }
] %}



SELECT 
    {% for config in congigs %}
        {{ config['columns'] }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM
    {% for config in congigs %}
    {% if loop.first %}
      {{ config['table'] }} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
        {% endif %}
        {% endfor %}