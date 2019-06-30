# Язык F#

## Преимущества
* Эко-язык (экологичный и экономичный). Больше творчества, меньше кода, особенно
  дублирующего.
* Функциональные языки развивают мозг, императивные - пальцы и навык copy-paste.
* Выполняет в больше степени роль DevOps-языка (executable specifications),
  поэтому легко может сочетаться с C#.
* Type inference обеспечивает максимальную обобщенность.

## Сомнения
* Не получится ли так, что мощная система типов окажется беспомощной, когда
  речь пойдет о динамической природе. Скажем, мы добавляем CommandType и
  ResultType из внешнего плагина. Или интерфейсы внешнего плагина могут стать
  частью типов?

## Типы
* TODO: Обнаружил в документации к FSharpType.GetRecordFields такой код
```fsharp
// Signature:
static member GetRecordFields : Type * ?BindingFlags -> PropertyInfo []
static member GetRecordFields : Type * ?bool -> PropertyInfo []

TODO: Ещё один пример
type Shape = 
    | Circle of radius:int
    | Rectangle of width:int * height:int

let rect1 = Rectangle(width = 100, height = 100)

TODO:BoundedTypes
http://blog.christopher-atkins.com/DependentTypesProvider/tutorial.html
Интересно, как они реализованы

TODO:Интересные аргументы функции
type Person = {
    Id: int
    First: string
    Last: string
}

let isValid { Person.Id = id } = 
    id > 0

TODO: Организация типов
module Person = 
    type T = {First:string; Last:string}...
	let create first last = { First = first; Last = last }
	
TODO:Расширение типов
type System.Int32 with
    member this.IsEven = this % 2 = 0
type System.Int32 with
    static member IsOdd x = x % 2 = 1
type T with 
	member this.SomeMethod = someFunc this
```

## Рефлексия
* [Microsoft.FSharp.Reflection](https://msdn.microsoft.com/en-us/visualfsharpdocs/conceptual/microsoft.fsharp.reflection-namespace-%5bfsharp%5d), как пример -
  FSharpType.GetRecordFields

## Соглашения
* TODO: Не рассматриваем функцию как вычисление, это - сервис, услуга, оказываемая
  некоторым агентом.
* TODO: Хотелось бы передавать в функцию один сложный тип, чтобы было больше
  контроля и лучше диспетчеризация агентам. Но могут возникнуть проблемы с
  каррированием? Технически, классические аргументы функции похожи на простой
  кортеж, но при каррировании они, видимо, деструктурируются. Можно ли
  аналогичное реализовать с другими типами, может используя "with".

## Для прочтения
* https://fsharpforfunandprofit.com/site-contents/
