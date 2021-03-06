## Преимущества
* Макросы и мета-программирование в целом. Возможность создавать прослойку
  между бизнес-языком и системным может дать существенную выгоду.
* ADT. Почти как у зрелых функциональных языков. Его первый компилятор писался
  на Rust, что говорит о некоторых предпочтениях авторов.
* Traits. Может даже лучше чем привычное ООП.
* Ресурсоёмкость программ. По тестам https://www.techempower.com/benchmarks/ и
  не только, демонстрирует впечатляющие результаты.
* Кросс-платформенность даёт выход на IoT рынок.
  * https://riscv.org/2017/11/rust-comes-risc-v/
* Системность может приблизить к bare-metal решениям в облаках.
* Termux support.

## Константы
Значения констант подставляются в месте их использования.По сути, описывает
псевдоним для некоторого значения.
const THRESHOLD: i32 = 10;
const VERSION: &'static str = env!("CARGO_PKG_VERSION");

## Статические переменные
В отличие от констант создает непосредственно глобальную переменную.
static LANGUAGE: &str = "Rust";

## Crate
TODO: https://crates.io/

## Cargo
TODO:cargo init
TODO:Workspaces

## Postgres
TODO:docker run -d --name pg1 -p 5432:5432 -e POSTGRES_PASSWORD=!qa2Ws3eD postgres:12