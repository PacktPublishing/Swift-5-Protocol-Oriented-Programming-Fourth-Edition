import Cocoa

public  typealias  DataFromURLCompletionClosure  =  (Data?)  ->  Void

public  struct  ITunesProxy  {
    public  func  sendGetRequest  (searchTerm:  String,  _  handler:  @escaping
        DataFromURLCompletionClosure)  {
        let  sessionConfiguration  =  URLSessionConfiguration.default
        var  url  =  URLComponents()
        url.scheme  =  "https"
        url.host  =  "itunes.apple.com"
        url.path  =  "/search"
        
        url.queryItems  =  [
            URLQueryItem(name:  "term",  value:  searchTerm),
        ]
        
        if  let  queryUrl  =  url.url  {
            var  request  =  URLRequest(url:queryUrl)
            request.httpMethod  =  "GET"
            let  urlSession  =  URLSession(
                configuration:sessionConfiguration,  delegate:  nil, delegateQueue:  nil)
            
            let  sessionTask  =  urlSession.dataTask(with:  request)  {
                (data,  response,  error)  in
                
                handler(data)
                
                
            }
            
            sessionTask.resume()
        }
    }
}


let  proxy  =  ITunesProxy()
proxy.sendGetRequest(searchTerm: "jimmy+buffett", {
if  let  data  =  $0,  let  sString  =  String(data:  data,  encoding: String.Encoding(rawValue:  String.Encoding.utf8.rawValue))  {
    
    print(sString)
    
}  else  {
    print("Data  is  nil")
}
})
