import Cocoa

extension  Int  {
    func  factorial()  ->  Int  {
        var  answer  =  1
        for  x  in  (1...self).reversed()  {
            answer  *=  x
        }
        return  answer
    }
}


10.factorial()

