* Основная цель инжиниринга - экономическая. 
* Экономика заботится о создании благ в условиях ограниченности ресурсов, что
  приводит нас к двум основным задачам - создание ценностей и снижение издержек.
* В обобщённом виде Success = Value - Waste.
* Поскольку речь идёт о суммарных издержках, появляется место и для
  иррациональных экспериментов. Как жертва ферзём может показаться абсурдной, но
  привести к победе, так и добавление процесса, который ведёт к издержкам, может
  в конечном счёте вылиться в существенную выгоду.

## Waste
* Каждый написанный кусок кода - это издержка. Как производственная, так и
  эксплуатационная.
* Одним из основных инструментов сокращения издержек является повторное
  использование. Поэтому принцип DRY является ключевым.
* Руководствуясь природой издержек важно понимать, что copy-paste - это
  практически удвоение издержек. Мы относимся к этой операции снисходительно,
  пока её плоды не носят лавинообразный характер.
* Здесь может возникнуть принцип, звучащий похоже с SRP. Должно быть только одно
  место для изменений.
* QA являются способом сокращения эксплуатационных издержек. В обшем случае мы
  можем сказать, что для LTS-продуктов издержки на создание тестов могут
  оказаться гораздо меньше эксплуатационных. Хорошие примеры - многомиллиардные
  финансовые и репутационные издержки автопроизводителей (многочисленные
  отзывные кампании) или история с Samsung Note 7.

## as-a-Code
* Разработчики привыкли работать с формализованным кодом. Всё, что им не
  является (устные или письменные инструкции, иллюстрации и т.п.) добавляет
  дополнительные издержки на преобразование. Преимущественно эксплуатационные.
* Пример - executable specifications (specification-as-a-Code). Они избавляют от
  издержек по преобразованию результаты интервью -> литературные спецификации
  -> тесты и обратно.
* Концепция as-a-Code является ключевой в совершенствовании средств
  производства.
* К сожалению, активным сектором в этом смысле, является только DevOps
  (Infrastructure-as-a-Code, CI/CD).
* Современные экосистемы всё чаще предлагают Compiler API (Rust, .NET,
  TypeScript, etc). Это новые возможности в эффективности производства
  (снижение издержек).
* Может пересекаться с концепцией SSoT, которая также призвана снижать издержки.

## Inbox
* Immutability конфликтует с идеей с reusing. Но не на уровне языка. Такая
  конструкция, к примеру, не говорит явно о том, может повторно использоваться
  входной параметр или нет.
    type Point = { x: int; y: int; }
    let negate input = { x = -input.x; y = -input.y; }
  И если язык Rust успешно демонстрируют, как можно контролировать владение
  объектом, возможно аналогичным образом компилятор может решать вопросы об
  эффективном переиспользовании уже аллоцированных структур.