# Parsing

## Dependencies
* [Architecture](architecture.md)

## Success
1. Легкий способ описания грамматик для быстрого прототипирования DSL.
2. Работа с бинарными и прочими типизированными потоками, не только с текстом.
3. Конкурентная удельная производительность (в сравнении с лидирующими серверами
   TCP/UDP-стека, JSON-декодерами и т.п.).
4. Работа с данными большого размера, которые невозможно загрузить целиком в
   память. Как в поточном режиме (включая восстановление при обрыве), так и в
   ленивом.
5. Инкрементные обновления, чтобы изменения осуществляемые в IDE, требовали
   минимум ресурсов и давали максимум интерактивности (для вспомогательных
   инструментов IDE).
6. Параллельная обработка, если это возможно.

## Theory
TODO: База (от Хомского) и терминология (символ, грамматика и т.п.).  
TODO: Расмотреть различные современные подходы  
TODO: https://habr.com/ru/post/348314/ - Парсеры, обработка текста. Просто о
сложном. CFG, BNF, LL(k), LR(k), PEG и другие страшные слова.  

### Packrat/PEG
TODO: "Более того, у packrat гораздо больше возможностей умного обнаружения
ошибок чем у любого другого подхода, потому как в любой момент времени полно
метаданных — и перепробованные варианты, и те что обломались, и те что
сработали. На каждый можно вполне декларативно навесить логику сообщений об
ошибках. Так же, преимущество packrat перед автоматным LL — возможноть
реализации левой рекурии в лоб. Ну и важнейшее свойство packrat — он lexerless
во первых, и расширяемый во вторых. Можно наследовать свойства грамматик, можно
расширять грамматики динамически."
https://habr.com/ru/post/99466/#comment_3077374  

## Cases
* Парсер команд и опций командной строки.
* Парсеры языков программирования. 
* (Де)сериализация JSON, XML, CSV и похожих текстовых форматов данных.
* (Де)сериализация бинарных форматов: данных (например, Parquet, ORC, Avro,
  protobuf), медиа (PNG, WEBP, MKV, x264, ...), приложений (7z, PSD, etc).
* Сервер из TCP/UDP-стека (HTTP/2, QUIC, WS, etc).
* Трансформация больших объемов данных, например гигантский CSV/Parquet в
  базу SQL. 
* IDE-редактор, который оперативно реагирует на вносимые изменения,
  инкрементно перестраивает модели и коммуницирует с некоторым подобием
  Language Server.
* Редактор, который мог бы работать с очень большим файлом, не загружая его
  целиком в память (docx, blender). А если ещё сможет и эффективно сохранять
  изменения.

## Responsibility
TODO: Надо дать детальное описание этому процессу и провести параллели и связи с
трансформациями, генерациями, (де)сериализациями, (де)кодированием,
процессингом. Чтобы более точно понимать зону ответственности.  
  
Суммарно в этом процессе можно рассмотреть три самостоятельных блока, которые
надо будет разделить по мере подтверждения гипотез.

### Grammar
Способ описания грамматики входного потока. Например, близкий к (E)BNF. Его
результатом будет являться создание процессора. Данный модуль является
опциональным, поскольку процессоры могут создаваться и без такой фабрики, а в
некоторых языках её создание может быть сопряжено с чрезмерными сложностями.

### Processor
Процессор - некоторый механизм поточной обработки. Мы не рассматриваем как
единственно возможный вариант парсинг текстового потока в AST-модель, хранящуюся
в памяти. Поэтому привычная функция TokenStream&lt;char&gt; ->
Result&lt;AstModel&gt; ставится под некоторое сомнение. Возможно, потребуется
всего лишь небольшая модификация, результатом которой будет условный Message.
За ним может скрываться как привычная AST-модель, так и сообщения о начале
разбора такой модели, её промежуточных состояних и успешном завершении (или
ошибке). Что в целом похоже на концепцию транзакции (begin->commit) и
предназначено для случаев, когда мы не можем разместить весь результат в памяти.

Часть этого механизма может быть общей для обработки любых потоков, что
позволяет перенести её ответственность в соответствующие модули. Они же будут
отвечать, например, за параллельную обработку.

### Consumer
Здесь уже находятся практичные способы использования результатов парсинга.
Это может быть умомянутое выстраивание AST-модели или отправка сообщений в
дальнейший потоковый обработчик.

## Гипотезы
Парсеры могут сфокусироваться на декларативном формате описания из которого
могут генерироваться потоковые, DOM и любые другие реализации. Способ достаточно
гибкий и может достигнуть оптимальных результатов с точки зрения
производительности. Но эффективен только в языках с хорошей поддержкой
мета-программирования и не всегда можно обойтись без написания конечных,
атомарных парсеров.

Другой вариант - message-based организация. Это может быть реализовано как в
виде функции (упрощённо TokenStream &rarr; MessageType) так и в виде
actor-based. Такой вариант практически единственно допустимый для потоковой
работы и должен подойти для формирования моделей в памяти, даже может выглядеть
более удачной реализацией. За счёт потенциально лучшего SRP и поддержки
инкрементного парсинга. 

Message-based организация выглядит достаточно выгодно, поскольку может
использоваться в очень широком спектре задач. А также неплохо сочетается с FSM,
которые уже себя неплохо зарекомендовали для подобного вида задач. Состояние
FSM может хорошо сочетаться с инкрементным разбором (состояние до измененного
участка), восстановлением после обрыва потока (состояние машины до обрыва или
на момент последнего "commit").

Оба упомянутых решения могут сосуществовать. Декларативный метод может
генерировать message-based реализацию.

## TODO:
* Какой могла бы быть архитектура, чтобы простые парсеры, вроде int.Parse(...)
  могли сосуществовать со сложными (поточными, ленивыми, асинхронными и т.п.).
* Для качественного PoC нужны хорошие работающие [cases](#cases). Можно начинать
  с более детального их описания.
* Как могут реализовываться streams/reactive streams/message-based решения (в
  том числе в разных языках, вроде F#, Rust, etc).
* Мы не всегда может знаем, какой конкретный символ начал обрабатываться. Для
  этого часто используется рекурсивный спуск. Но, как правило, такие объекты не
  очень большие и могу возвращаться целиком. Другой вариант - процессор может
  отправлять сообщения и о "гипотезах".
* Как лучше оформить описание грамматик и трансформацию в FSM, если она будет
  использована.
* Хотелось бы в определённых случаях уметь работать со span. К сожалению, с
  потоковой обработкой он плохо совместим.
* Как бы могла выглядеть реализация, когда JSON может десериализоваться как
  в специфичную для него DOM модель, так может и в какую-то обобщенную
  объектную, из которой он может быть преобразован в XML/YAML? Это вопрос
  дополнительной трансформации, специализированного парсинга (может с
  определённой долей реюзинга) или того, что DOM модель JSON будет реализовывать
  обобщённые контракты? Может комбинации из этих вариантов.
* Потоковый вариант реализации может хорошо сочетаться с журналированием,
  неплохо работать с DataScience.
* Переходя уже в зону ответственности DOM-моделей можно вводить возможности
  повторного использования узлов. Помимо типового применения для констант
  (в .NET одна и та же символьная строка будет только один эксземпляр) и
  схожей экономии, это может быть полезно и для анализа издержек. Причём, речь
  может идти не только и листовых узлах, но и более глубоких. Может даже
  параметризованный реюзтинг, когда ветки отличаются несущественно.
* Для некоторых задач может иметь смысл кэшировать дерево CodeDOM в некотором
  бинарном формате. Но этот функционал скорее лежит за пределами парсинга,
  хотя механизм уведомления об изменениях (когда надо обновлять кэш) может быть
  задействован.