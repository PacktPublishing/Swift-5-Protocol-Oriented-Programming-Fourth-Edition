import Cocoa

protocol  List  {
    associatedtype  T
    subscript<E:  Sequence>(indices:  E)  ->  [T]
        where  E.Iterator.Element  ==  Int  {  get  }
    mutating  func  add(_  item:  T)
    func  length()  ->  Int
    func  get(at  index:  Int)  ->  T?
    mutating  func  delete(at  index:  Int)
}

private  class  BackendList<T>  {
    private  var  items:  [T]  =  []
    
    public  init()  {}
    private  init(_  items:  [T])  {
        self.items  =  items
    }
    
    public  func  add(_  item:  T)  {
        items.append(item)
    }
    public  func  length()  ->  Int  {
        return  items.count
    }
    public  func  get(at  index:  Int)  ->  T?  {
        return  items[index]
    }
    public  func  delete(at  index:  Int)  {
        items.remove(at:  index)
    }
    public  func  copy()  ->  BackendList<T>  {
        return  BackendList<T>(items)
    }
}

struct  ArrayList<T>:  List  {
    private  var  items  =  BackendList<T>()
    
    public  subscript<E:  Sequence>(indices:  E)  ->  [T]
        where  E.Iterator.Element  ==  Int  {
            var  result  =  [T]()
            for  index  in  indices  {
                if  let  item  =  items.get(at:  index)  {
                    result.append(item)
                }
            }
            return  result
    }
    
    public  mutating  func  add(_  item:  T)  {
        checkUniquelyReferencedInternalQueue()
        items.add(item)
    }
    public  func  length()  ->  Int  {
        return  items.length()
    }
    public  func  get(at  index:  Int)  ->  T?  {
        return  items.get(at:  index)
    }
    public  mutating  func  delete(at  index:  Int)  {
        checkUniquelyReferencedInternalQueue()
        items.delete(at:  index)
    }
    
    mutating  private  func  checkUniquelyReferencedInternalQueue()  {
        if  !isKnownUniquelyReferenced(&items)  {
            print("Making  a  copy  of  internalQueue")
            items  =  items.copy()
        }  else  {
            print("Not  making  a  copy  of  internalQueue")
        }
    }
}

var  arrayList  =  ArrayList<Int>()
arrayList.add(1)
arrayList.add(2)
arrayList.add(3)

