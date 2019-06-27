import Cocoa

protocol  TextValidation  {
    var  regExFindMatchString:  String  {get}
    var  validationMessage:  String  {get}
}

extension  TextValidation  {
    var  regExMatchingString:  String  {
        get  {
            return  regExFindMatchString  +  "$"
        }
    }
    
    func  validateString(str:  String)  ->  Bool  {
        if  let  _  =  str.range(of:  regExMatchingString, options:  .regularExpression)  {
            return  true
        }  else  {
            return  false
        }
    }
    
    func  getMatchingString(str:  String)  ->  String?  {
        if  let  newMatch  =  str.range(of:  regExFindMatchString, options:  .regularExpression)  {
            return  String(str[newMatch])
        }  else  {
            return  nil
        }
    }
}


class  AlphaValidation:  TextValidation  {
    static  let  sharedInstance  =  AlphaValidation()
    private  init(){}
    let  regExFindMatchString  =  "^[a-zA-Z]{0,10}"
    let  validationMessage  =  "Can  only  contain  Alpha  characters"
}

class  AlphaNumericValidation:  TextValidation  {
    static  let  sharedInstance  =  AlphaNumericValidation()
    private  init(){}
    let  regExFindMatchString  =  "^[a-zA-Z0-9]{0,10}"
    let  validationMessage  =  "Can  only  contain  Alpha  Numeric  characters"
}

class  NumericValidation:  TextValidation  {
    static  let  sharedInstance  =  NumericValidation()
    private  init(){}
    let  regExFindMatchString  =  "^[0-9]{0,10}"
    let  validationMessage  =  "Display  Name  can  contain  a  maximum  of 15  Alphanumeric Characters"
}

func  getValidator(alphaCharacters:  Bool,  numericCharacters:  Bool)  -> TextValidation?  {
    if  alphaCharacters  &&  numericCharacters  {
        return  AlphaNumericValidation.sharedInstance
    }  else  if  alphaCharacters  &&  !numericCharacters  {
        return  AlphaValidation.sharedInstance
    }  else  if  !alphaCharacters  &&  numericCharacters  {
        return  NumericValidation.sharedInstance
    }  else  {
        return  nil
    }
}

var  str  =  "abc123"
var  validator1  =  getValidator(alphaCharacters:  true, numericCharacters:  false)
print("String  validated:  \(validator1?.validateString(str:  str))")

var  validator2  =  getValidator(alphaCharacters:  true, numericCharacters:  true)
print("String  validated:  \(validator2?.validateString(str:  str))")
