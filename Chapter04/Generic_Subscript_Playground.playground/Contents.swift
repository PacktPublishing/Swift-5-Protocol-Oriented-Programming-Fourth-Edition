import Cocoa

struct  List<T>  {
    private  var  items  =  [T]()
    public  mutating  func  add(item:  T)  {
        items.append(item)
    }
    public  func  getItemAtIndex(index:  Int)  ->  T?  {
        if  items.count  >  index  {
            return  items[index]
        }  else  {
            return  nil
        }
    }
    public  subscript(index:  Int)  ->  T?  {
        return  getItemAtIndex(index:  index)
    }
    public  subscript<E:  Sequence>(indices:  E)  ->  [T]  where  E.Iterator.Element ==  Int  {
            var  result  =  [T]()
            for  index  in  indices  {
                result.append(items[index])
            }
            return  result
    }

}

var  myList  =  List<Int>()
myList.add(item:  1)
myList.add(item:  2)
myList.add(item:  3)
myList.add(item:  4)
myList.add(item:  5)

var  values  =  myList[2...4]
