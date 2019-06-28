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
