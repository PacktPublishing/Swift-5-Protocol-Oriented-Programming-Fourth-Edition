import Cocoa

extension  Collection  {
    func  evenElements()  ->  [Iterator.Element]  {
        
        var  index  =  startIndex
        var  result:  [Iterator.Element]  =  []
        var  i  =  0
        repeat  {
            if  i  %  2  ==  0  {
                result.append(self[index])
            }
            index  =  self.index(after:  index)
            i  +=  1
        }  while  (index  !=  endIndex)
        return  result
    }
}


var  origArray  =  [1,2,3,4,5,6,7,8,9,10]

var  newArray  =  origArray.evenElements()


