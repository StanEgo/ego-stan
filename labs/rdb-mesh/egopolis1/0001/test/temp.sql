INSERT INTO
    mesh.prototype
VALUES
(
    'location',
    'context',
    'Место. Может выступать в качестве контекста.'
),
(
    'mood',
    'context',
    'Настроение. Может выступать в качестве контекста.'
),
(
    'device',
    NULL,
    'Устройство.'
)
;

INSERT INTO mesh.node VALUES
(
    'philips-s5130',
    'device',
    'Бритва Philips S5130',
    '
        <hint>
            Стоит осуществлять только круговые движения, а не прямолинейные.
        </hint>
        <hint>
            Чтобы обеспечивать мягкое скольжение, надо смачивать бритву под водой.
        </hint>
        <hint>
            Можно использовать крем или пену для бритья, нанеся её на лицо, предварительно
            смочив его водой.
        </hint>
        <step>
            После бритья надо промыть ножи снаружи теплой водой, потом открыть головку, в
            течение 30 секунд промыть ножи с внутренней стороны, тщательно стряхнуть и
            просушить.
        </step>
        <synergy>TODO:Можно использовать в душе, своеобразная синергия.</synergy>
    ',
    '2016-12-09 20:14:52'
),
(
    'i-am-shaving',
    'activity',
    'Побриться',
    '
        <!--TODO:Использование устройства помогает вытащить связанные с ним хинты и т.п.-->
        <device id="philips-s5130" />
        <synergy activity="TODO:">
            В контексте этой активности можно читать или ещё что-то делать.
        </synergy>
    ',
    '2016-12-09 20:15:33'
)
--TODO:MetroCC и покупки.
--TODO:Эксплуатируя некоторое устройство можно сразу формировать его бортовой журнал, давать оценки и т.п.
--TODO:К активности можно цеплять шедулер, а также журнал (чтобы были кнопки старт и стоп).
--TODO:Активность в целом (бритье) и моё бритье стоит разделить.
--TODO:Зубная счетка и активность по чистке зубов. Вместе с бритьем объединить в утренний ритуал.
;