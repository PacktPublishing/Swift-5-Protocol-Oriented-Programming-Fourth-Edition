import Cocoa

struct  BurgerOld  {
    var  name:  String
    var  patties:  Int
    var  bacon:  Bool
    var  cheese:  Bool
    var  pickles:  Bool
    var  ketchup:  Bool
    var  mustard:  Bool
    var  lettuce:  Bool
    var  tomato:  Bool
    init(name:  String,  patties:  Int,  bacon:  Bool,  cheese:  Bool, pickles:  Bool,  ketchup:  Bool,  mustard:  Bool, lettuce:  Bool,  tomato:  Bool)  {
        self.name  =  name
        self.patties  =  patties
        self.bacon  =  bacon
        self.cheese  =  cheese
        self.pickles  =  pickles
        self.ketchup  =  ketchup
        self.mustard  =  mustard
        self.lettuce  =  lettuce
        self.tomato  =  tomato
    }
}

//  Create  Hamburger
var  burgerOld  =  BurgerOld(name:  "Hamburger",  patties:  1,  bacon:  false, cheese:  false,  pickles:  false,  ketchup:  false, mustard:  false,  lettuce:  false,  tomato:  false)

//  Create  Cheeseburger
var  cheeseburgerOld  =  BurgerOld(name:  "Cheeseburger",  patties:  1, bacon:  false,  cheese:  false, pickles:  false,  ketchup:  false, mustard:  false,  lettuce:  false, tomato:  false)

protocol  BurgerBuilder  {
    var  name:  String  {get}
    var  patties:  Int  {get}
    var  bacon:  Bool  {get}
    var  cheese:  Bool  {get}
    var  pickles:  Bool  {get}
    var  ketchup:  Bool  {get}
    var  mustard:  Bool  {get}
    var  lettuce:  Bool  {get}
    var  tomato:  Bool  {get}
}

struct  HamburgerBuilder:  BurgerBuilder  {
    let  name  =  "Burger"
    let  patties  =  1
    let  bacon  =  false
    let  cheese  =  false
    let  pickles  =  true
    let  ketchup  =  true
    let  mustard  =  true
    let  lettuce  =  false
    let  tomato  =  false
}

struct  CheeseBurgerBuilder:  BurgerBuilder  {
    let  name  =  "CheeseBurger"
    let  patties  =  1
    let  bacon  =  false
    let  cheese  =  true
    let  pickles  =  true
    let  ketchup  =  true
    let  mustard  =  true
    let  lettuce  =  false
    let  tomato  =  false
}

struct  Burger  {
    var  name:  String
    var  patties:  Int
    var  bacon:  Bool
    var  cheese:  Bool
    var  pickles:  Bool
    var  ketchup:  Bool
    var  mustard:  Bool
    var  lettuce:  Bool
    var  tomato:  Bool
    
    init(builder:  BurgerBuilder)  {
        self.name  =  builder.name
        self.patties  =  builder.patties
        self.bacon  =  builder.bacon
        self.cheese  =  builder.cheese
        self.pickles  =  builder.pickles
        self.ketchup  =  builder.ketchup
        self.mustard  =  builder.mustard
        self.lettuce  =  builder.lettuce
        self.tomato  =  builder.tomato
    }
    
    func  showBurger()  { print("Name:\(name)")
        print("Patties:  \(patties)")
        print("Bacon:\(bacon)")
        print("Cheese:\(cheese)")
        print("Pickles:  \(pickles)")
        print("Ketchup:  \(ketchup)")
        print("Mustard:  \(mustard)")
        print("Lettuce:  \(lettuce)")
        print("Tomato:\(tomato)")
    }
}

//  Create  Hamburger
var  myBurger  =  Burger(builder:  HamburgerBuilder())
myBurger.showBurger()

//  Create  Cheeseburger  with  tomatos
var  myCheeseBurgerBuilder  =  CheeseBurgerBuilder()
var  myCheeseBurger  =  Burger(builder:  myCheeseBurgerBuilder)

//  Let's  hold  the  tomatos
myCheeseBurger.tomato  =  false
myCheeseBurger.showBurger()


struct  BurgerBuilder1  {
    var  name  =  "Burger"
    var  patties  =  1
    var  bacon  =  false
    var  cheese  =  false
    var  pickles  =  true
    var  ketchup  =  true
    var  mustard  =  true
    var  lettuce  =  false
    var  tomato  =  false
    
    mutating  func  setPatties(choice:  Int)  {self.patties  =  choice}
    mutating  func  setBacon(choice:  Bool)  {self.bacon  =  choice}
    mutating  func  setCheese(choice:  Bool)  {self.cheese  =  choice}
    mutating  func  setPickles(choice:  Bool)  {self.pickles  =  choice}
    mutating  func  setKetchup(choice:  Bool)  {self.ketchup  =  choice}
    mutating  func  setMustard(choice:  Bool)  {self.mustard  =  choice}
    mutating  func  setLettuce(choice:  Bool)  {self.lettuce  =  choice}
    mutating  func  setTomato(choice:  Bool)  {self.tomato  =  choice}
    
    func  buildBurgerOld(name:  String)  ->  BurgerOld  {
        return  BurgerOld(name:  name,  patties:  self.patties, bacon:  self.bacon,  cheese:  self.cheese, pickles:  self.pickles,  ketchup:  self.ketchup, mustard:  self.mustard,  lettuce:  self.lettuce, tomato:  self.tomato)
    }
}

var  burgerBuilder  =  BurgerBuilder1()
burgerBuilder.setCheese(choice:  true)
burgerBuilder.setBacon(choice:  true)
var  jonBurger  =  burgerBuilder.buildBurgerOld(name:  "Jon's  Burger")
