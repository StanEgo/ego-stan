INSERT INTO mesh.node (
    id,
    prototype,
    title,
    data,
    created
)
VALUES
(
    'purchase-nutribullet',
    'purchase',
    'Купить Nutribullet',
    'TODO:
        <task completed="false"/>
        <relation from="nutribullet-device" to="fitness-project" />
    ',
    '2016-12-17 21:09:56'
),
(
    'purchase-monitor',
    'purchase',
    'Купить монитор',
    'TODO:
        <task completed="false"/>
        <relation from="monitor-device-group" to="office-project" />
    ',
    '2016-12-17 21:09:56'
);
