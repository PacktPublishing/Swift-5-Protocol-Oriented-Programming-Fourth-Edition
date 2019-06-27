import Cocoa

protocol  MathCommand  {
    func  execute(num1:  Double,  num2:  Double)  ->  Double
}


struct  AdditionCommand:  MathCommand  {
    func  execute(num1:  Double,  num2:  Double)  ->  Double  {
        return  num1  +  num2
    }
}

struct  SubtractionCommand:  MathCommand  {
    func  execute(num1:  Double,  num2:  Double)  ->  Double  {
        return  num1  -  num2
    }
}

struct  MultiplicationCommand:  MathCommand  {
    func  execute(num1:  Double,  num2:  Double)  ->  Double  {
        return  num1  *  num2
    }
}


struct  DivisionCommand:  MathCommand  {
    func  execute(num1:  Double,  num2:  Double)  ->  Double  {
        return  num1  /  num2
    }
}

struct  Calculator  {
    func  performCalculation(num1:  Double,  num2:  Double, command:  MathCommand)  ->  Double{
        return  command.execute(num1:  num1,  num2:  num2)
    }
}


var  calc  =  Calculator()
var  startValue  =  calc.performCalculation(num1:  25,  num2:  10,  command: SubtractionCommand())
var  answer  =  calc.performCalculation(num1:  startValue,  num2:  5,  command: MultiplicationCommand())

