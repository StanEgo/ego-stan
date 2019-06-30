## Инициализация sample-объектов
Можно ли реализовать композицию из различных функций-инициализаторов, как целых
объектов, так и их отдельных аспектов.

let alice = person (name "Alice" "Red") (lifetime ...) (login ...)

Функция верхнего уровня рассматривает дочерние как выражения для инициализации
некоторых интерфейсов (with ...)

## Function overload
let overload (a:int) = 1
let overload (a:int) (b:int) = 2

## Полиморфизм типов
type ManagerSample = 
    | Alice
    | Bob

type AdminSample =
    | Stan
    | Julia

type UserSample =
    | ManagerSample
    | AdminSample

let user (sample:UserSample) =
    printf "User %A by id" sample

// test.fsx(28,6): error FS0001: This expression was expected to have type
//    'UserSample'    
// but here has type
//    'ManagerSample'
user Alice
