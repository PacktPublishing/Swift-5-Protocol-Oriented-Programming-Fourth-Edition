import Cocoa

extension  Int  {
    func  squared()  ->  Int  {
        return  self  *  self
    }
}

print(21.squared())


extension  Double  {
    func  currencyString()  ->  String  {
        let  divisor  =  pow(10.0,  2.0)
        let  num  =  (self  *  divisor).rounded()  /  divisor
        return  "$\(num)"
    }
}

