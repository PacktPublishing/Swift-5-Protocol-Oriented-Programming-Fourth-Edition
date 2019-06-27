import Cocoa

protocol  Message  {
    var  messageString:  String  {get  set}
    init(messageString:  String)
    func  prepareMessage()
}

protocol  Sender  {
    var  message:  Message?  {get  set}
    func  sendMessage()
    func  verifyMessage()
}


class  PlainTextMessage:  Message  {
    var  messageString:  String
    required  init(messageString:  String)  {
        self.messageString  =  messageString
    }
    func  prepareMessage()  {
        //Nothing  to  do
    }
}

class  DESEncryptedMessage:  Message  {
    var  messageString:  String
    required  init(messageString:  String)  {
        self.messageString  =  messageString
    }
    func  prepareMessage()  {
        //  Encrypt  message  here
        self.messageString  =  "DES:  "  +  self.messageString
    }
}


class  EmailSender:  Sender  {
    var  message:  Message?
    func  sendMessage()  {
        print("Sending  through  E-Mail:")
        print("\(message!.messageString)")
    }
    func  verifyMessage()  {
        
        
        print("Verifying  E-Mail  message")
    }
}

class  SMSSender:  Sender  {
    var  message:  Message?
    func  sendMessage()  {
        print("Sending  through  SMS:")
        print("  \(message!.messageString)")
    }
    func  verifyMessage()  {
        print("Verifying  SMS  message")
    }
}



var  myMessage  =  PlainTextMessage(messageString:  "Plain  Text  Message")
myMessage.prepareMessage()
var  sender  =  SMSSender()
sender.message  =  myMessage
sender.verifyMessage()
sender.sendMessage()

struct  MessagingBridge  {
    static  func  sendMessage(message:  Message,  sender:  Sender)    {
        var  sender  =  sender
        message.prepareMessage()
        sender.message  =  message
        sender.verifyMessage()
        sender.sendMessage()
    }
}


