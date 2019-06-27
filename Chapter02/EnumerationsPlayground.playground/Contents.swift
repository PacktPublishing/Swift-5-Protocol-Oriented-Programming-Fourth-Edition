import Cocoa


enum  Devices  {
    case  IPod(model:  Int,  year:  Int,  memory:  Int)
    case  IPhone(model:  String,  memory:  Int)
    case  IPad(model:  String,  memory:  Int)
}

var  myPhone  =  Devices.IPhone(model:  "6",  memory:  64)
var  myTablet  =  Devices.IPad(model:  "Pro",  memory:  128)

switch  myPhone  {
case  .IPod(let  model,  let  year,  let  memory):
    print("iPod:  \(model)  \(memory)")
case  .IPhone(let  model,  let  memory):
    print("iPhone:  \(model)  \(memory)")
case  .IPad(let  model,  let  memory):
    print("iPad:  \(model)  \(memory)")
}


enum  Reindeer:  String  {
    case  Dasher,  Dancer,  Prancer,  Vixen,  Comet,  Cupid,  Donner,  Blitzen, Rudolph
    static  var  allCases:  [Reindeer]  {
        return  [Dasher,  Dancer,  Prancer,  Vixen,  Comet,  Cupid,  Donner,  Blitzen, Rudolph]
    }
    static  func  randomCase()  ->  Reindeer  {
        let  randomValue  =  Int(
            arc4random_uniform( UInt32(allCases.count)
            )
        )
        return  allCases[randomValue]
    }
}


enum  BookFormat  {
    case PaperBack (pageCount: Int, price: Double)
    case HardCover (pageCount: Int, price: Double)
    case  PDF  (pageCount:  Int,  price:  Double)
    case  EPub  (pageCount:  Int,  price:  Double)
    case  Kindle  (pageCount:  Int,  price:  Double)
    
    var  pageCount:  Int  {
        switch  self  {
        case  .PaperBack(let  pageCount,  _):
            return  pageCount
        case  .HardCover(let  pageCount,  _):
            return  pageCount
        case  .PDF(let  pageCount,  _):
            return  pageCount
        case  .EPub(let  pageCount,  _):
            return  pageCount
        case  .Kindle(let  pageCount,  _):
            return  pageCount
        }
    }
    var  price:  Double  {
        switch  self  {
        case  .PaperBack(_,  let  price):
            return  price
        case  .HardCover(_,  let  price):
            return  price
        case  .PDF(_,  let  price):
            return  price
        case  .EPub(_,  let  price):
            return  price
        case  .Kindle(_,  let  price):
            return  price
        }
    }
    
    func  purchaseTogether(otherFormat:  BookFormat)  ->  Double  {
        return  (self.price  +  otherFormat.price)  *  0.80
    }

}


var  paperBack  =  BookFormat.PaperBack(pageCount:  220,  price:  39.99)
var  pdf  =  BookFormat.PDF(pageCount:  180,  price:  14.99)
var  total  =  paperBack.purchaseTogether(otherFormat:  pdf)






