namespace SDD.Specification

module Security =
    // TODO: Эксперимент, как можно было бы начать строить спецификации с
    // использования естественного языка, который потом можно заворачивать
    // в XML-Doc.
    type ToDo = string

    type ``Форма входа`` = {
        /// <summary>
        /// TODO:Login property definition
        /// </summary>
        ``логин``: string;

        ``пароль``: string
    }
    
    type ``Результат входа`` =
        | ``Успешный вход`` = 200
        | ``Неправильный логин или пароль`` = 403
    
    type ``Вход по паролю`` =
        ``Форма входа`` -> ``Результат входа``

    type ``Вход по социальным сетям`` = ToDo

    type ``вход в систему`` = 
        | ``Вход по паролю``
        | ``Вход по социальным сетям``

module Social = 
    open System

    type Person = {
        First:string
        Last:string
    }

    let alice = {
        First = "Alice"
        Last = "Red"
    }

    // TODO: Эксперимент с использование кортежей вместо интерфейсов (провал)
    type HasId = { Id: int }
    type HasName = { First: string; Last: string }
    type Alive = { Borned: DateTime }
    type Dead = { Borned: DateTime; Dead: DateTime }
    type Lifetime = 
        | Alive of Alive
        | Dead of Dead
    type User = HasId * HasName * Lifetime
    let bob = (
        { Borned = DateTime.UtcNow },
        { Id = 10 },
        { First = "Bob"; Last = "Stark" }
    )
    let validate (user: HasId * Lifetime) =
        true
    //TODO: let result = validate bob
