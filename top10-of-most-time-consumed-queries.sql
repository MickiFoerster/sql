SELECT round((100 * total_exec_time / sum(total_exec_time)
    OVER ())::numeric, 2) percent,
    round(total_exec_time::numeric, 2) AS total_exec_time_ms,
    calls,
    round(mean_exec_time::numeric, 2) AS mean_exec_time_ms,
    substring(query, 1, 200)
    FROM pg_stat_statements
    ORDER BY total_exec_time DESC
    LIMIT 10;
