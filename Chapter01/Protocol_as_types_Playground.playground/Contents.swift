import Cocoa

protocol  Person  {
    var  firstName:  String  {get  set}
    var  lastName:  String  {get  set}
    var  birthDate:  Date  {get  set}
    var  profession:  String  {get}
    init  (firstName:  String,  lastName:  String,  birthDate:  Date)
}


func  updatePerson(person:  Person)  ->  Person  {
    var  newPerson:  Person
    //  Code  to  update  person  goes  here
    return  newPerson
}

