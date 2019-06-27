import Cocoa

let  mathGrade1  =  ("Jon",  100)
let  (name,  score)  =  mathGrade1
print("\(name)  -  \(score)")


let  mathGrade2  =  (name:  "Jon",  grade:  100)
print("\(mathGrade2.name)  -  \(mathGrade2.grade)")



func  calculateTip(billAmount:  Double,tipPercent:  Double)  -> (tipAmount:  Double,  totalAmount:  Double)  {
    let  tip  =  billAmount  *  (tipPercent/100)
    let  total  =  billAmount  +  tip
    return  (tipAmount:  tip,  totalAmount:  total)
}

var  tip  =  calculateTip(billAmount:31.98,  tipPercent:  20)
print("\(tip.tipAmount)  -  \(tip.totalAmount)")

typealias  myTuple  =  (tipAmount:  Double,  totalAmount:  Double)
