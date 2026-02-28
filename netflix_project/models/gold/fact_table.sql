{% set congigs = [
    {
        "table" : "NETFLIX.gold.obt",
        "columns" : "gold_obt.DURATION_MINUTES, gold_obt.DURATION_SEASONS, gold_obt.RELEASE_YEAR,gold_obt.SHOW_ID",
        "alias" : "gold_obt"
    }
] %}

SELECT 
        {{ congigs[0]['columns'] }}

FROM
    {% for config in congigs %}
    {% if loop.first %}
      {{ config['table'] }} AS {{ config['alias'] }}
    {% else %}
        LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
        ON {{ config['join_condition'] }}
        {% endif %}
        {% endfor %}