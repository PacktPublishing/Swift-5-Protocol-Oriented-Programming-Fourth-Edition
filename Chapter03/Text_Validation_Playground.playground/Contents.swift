import Cocoa

protocol  TextValidation  {
    var  regExFindMatchString:  String  {get}
    var  validationMessage:  String  {get}
}


extension TextValidation  {
    var  regExMatchingString:  String  {
        get  {
            return  regExFindMatchString  +  "$"
        }
    }
    func  validateString(str:  String)  ->  Bool  {
        if  let  _  =  str.range(of:  regExMatchingString, options:  .regularExpression){
            return  true
        }  else  {
            return  false
        }
    }
    func  getMatchingString(str:  String)  ->  String?  {
        if  let  newMatch  =  str.range(of:  regExFindMatchString, options:  .regularExpression)  {
            return String(str[newMatch])
        }  else  {
            return  nil
        }
    }
}

class  AlphabeticValidation:  TextValidation  {
    static  let  sharedInstance  =  AlphabeticValidation()
    private  init(){}
    let  regExFindMatchString  =  "^[a-zA-Z]{0,10}"
    let  validationMessage  =  "Can  only  contain  Alpha  characters"
}

class  AlphaNumericValidation:  TextValidation  {
    static  let  sharedInstance  =  AlphaNumericValidation()
    private  init(){}
    let  regExFindMatchString  =  "^[a-zA-Z0-9]{0,15}"
    let  validationMessage  =  "Can  only  contain  Alpha  Numeric  characters"
}

class  DisplayNameValidation:  TextValidation  {
    static  let  sharedInstance  =  DisplayNameValidation()
    private  init(){}
    let  regExFindMatchString  =  "^[\\s?[a-zA-Z0-9\\-_\\s]]{0,15}"
    let  validationMessage  =  "Display  Name  can  contain  only  contain Alphanumeric  Characters"
}


var  myString1  =  "abcxyz"
var  myString2  =  "abc123"
var  validation  =  AlphabeticValidation.sharedInstance
validation.validateString(str:  myString1)
validation.validateString(str:  myString2)

validation.getMatchingString(str:  myString1)
validation.getMatchingString(str:  myString2)

