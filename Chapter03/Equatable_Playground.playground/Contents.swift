import Cocoa

struct  Place  {
    let  id:  String
    let  latitude:  Double
    let  longitude:  Double
}

extension  Place:  Equatable  {
    static  func  ==(lhs:  Place,  rhs:  Place)  ->  Bool  {
        return  lhs.id  ==  rhs.id  && lhs.latitude  ==  rhs.latitude  && lhs.longitude  == rhs.longitude
    }
}

var  placeOne  =  Place(id:  "Fenway  Park",  latitude:  42.3467,  longitude:
    -71.0972)
var  placeTwo  =  Place(id:  "Wrigley  Field",  latitude:  41.9484,  longitude:
    -87.6553)

print(placeOne  ==  placeTwo)


