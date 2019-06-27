import Cocoa

protocol  FullName  {
    var  firstName:  String  {get  set}
    var  lastName:  String  {get  set}
    
    func  getFullName()  ->  String
}

protocol  Person:  FullName  {
    var  age:  Int  {get  set}
}


struct  Student:  Person  {
    var  firstName  =  ""
    var  lastName  =  ""
    var  age  =  0
    
    func  getFullName()  ->  String  {
        return  "\(firstName)  \(lastName)"
    }
}

