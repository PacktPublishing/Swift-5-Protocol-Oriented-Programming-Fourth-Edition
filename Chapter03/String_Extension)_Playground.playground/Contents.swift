import Cocoa


extension  String  {
    func  getThirdChar()  ->  Character?  {
        guard  self.count  >  2 else  {
            return  nil
        }
        return  self[self.index(self.startIndex, offsetBy: 2)]
    }
    
    subscript  (r:  CountableClosedRange<Int>)  ->  String  {
        get  {
            let  start  =  index(self.startIndex,  offsetBy:r.lowerBound)
            let  end  =  index(self.startIndex,  offsetBy:r.upperBound)
            return String(self[start ..< end])
        //    return  substring(with:  start..<end)
        }
    }
}

var str = "Hello, playground"

str.getThirdChar()


