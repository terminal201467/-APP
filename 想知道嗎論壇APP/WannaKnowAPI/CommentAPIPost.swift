////
////  CommentPost.swift
////  想知道嗎論壇APP
////
////  Created by Jhen Mu on 2022/4/7.
////
//
//import Foundation
//#if canImport(FoundationNetworking)
//import FoundationNetworking
//import CoreData
//#endif
//
//class CommentsAPIPost{
//    
//    //MARK:-Properties
//
//    let parameters = [
//      [ "key": "wanna_know_id","value": "5cab3c86-466b-4845-8a2a-b00ba1d6745s","type": "text"],
//      [ "key": "content","value": "","type": "text" ]] as [[String : Any]]
//    
//    var body = ""
//    
//    let boundary = "Boundary-\(UUID().uuidString)"
//    
//    var error: Error? = nil
//    
//    //MARK:-Method
//    func buildBody(){
//        
//        for param in parameters {
//            if param["disabled"] == nil {
//                let paramName = param["key"]!
//                body += "--\(boundary)\r\n"
//                body += "Content-Disposition:form-data; name=\"\(paramName)\""
//                
//                if param["contentType"] != nil {
//                    
//                    body += "\r\nContent-Type: \(param["contentType"] as! String)"
//                }
//                
//                let paramType = param["type"] as! String
//                
//                if paramType == "text" {
//                    
//                    let paramValue = param["value"] as! String
//                    body += "\r\n\r\n\(paramValue)\r\n"
//                    
//                } else {
//                    
//                    let paramSrc = param["src"] as! String
//                    let fileData = try NSData(contentsOfFile:paramSrc, options:[]) as Data
//                    let fileContent = String(data: fileData, encoding: .utf8)!
//                    
//                    body += "; filename=\"\(paramSrc)\"\r\n" + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
//                }
//            }
//        }
////        body += "--\(boundary)--\r\n";
//    }
//    
//    
//    func buildRequest(){
//        let postData = body.data(using: .utf8)
//        var request = URLRequest(url: URL(string: "https://script.google.com/macros/s/AKfycbxrKLGCRMbyFNEzsAwcwrQazvfxbDK6TiTwzqwVkDKxDxVKV620rCK3fXhtzQNuB00c/exec")!,timeoutInterval: Double.infinity)
//        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        request.httpBody = postData
//    }
//    
//    func PostComments(){
//        let task = URLSession.shared.dataTask(with: request,completionHandler: @escaping ResultType<> data, response, error in
//          guard let data = data else {
//            print(String(describing: error))
//            semaphore.signal()
//            return
//          }
//          print(String(data: data, encoding: .utf8)!)
//          semaphore.signal()
//        }
//        task.resume()
//        semaphore.wait()
//    }
//}
//
//
//extension CommentsAPIPost{
//    enum postParameter{
//        case wannaKnowComment(PostComments)
//        case wannaKnowLike(PostLike)
//    }
//    
//}
