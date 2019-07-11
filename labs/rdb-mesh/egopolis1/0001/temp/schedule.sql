CREATE TABLE temp.schedule (
    id SERIAL,
    title text NOT NULL,
    notes xml NOT NULL, --TODO:Description should be optionally attached
    cron text NOT NULL,

    -- TODO:Time before scheduled to start notifications 
    notify interval NULL,
    -- TODO:When should be executed next time or NULL if not calculated yet.
    next timestamp NULL
);

INSERT INTO temp.schedule (
    title,
    notes,
    cron,
    notify
) VALUES
(
    'Утренний ритуал красоты',
    '
        <step title="Чистка зубов">
        </step>
        <step title="Бритье">
        </step>
        <hint>
            
        </hint>
    ',
    'onenote:D', -- Каждый день
    NULL
),
(
    'Заплатить за сад',
    'До 7го числа каждого месяца надо заплатить за детский сад',
    'onenote:M07', -- Каждый месяц седьмого числа
    INTERVAL '5 days'
    --TODO:Двое ответственных, я и Юльча
)
;
