//
//  CommentsAPI.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/25.
//

import Foundation

class CommentsAPI{
    //MARK:-Properties
    static let shared = CommentsAPI()
    
    private let baseURL =  "https://script.google.com/macros/s/AKfycbxrKLGCRMbyFNEzsAwcwrQazvfxbDK6TiTwzqwVkDKxDxVKV620rCK3fXhtzQNuB00c/exec"
    
    //MARK:-BuildRequest
    private func buildRequest(callBy:[CommentCallMethod])->URLRequest{
        var components = URLComponents(string: baseURL)
        var query:[String:Any] = [:]
        callBy.map{$0.parameter.map{query[$0.key] = $0.value}}
        components?.queryItems = query.map({URLQueryItem(name: $0.key,value:"\($0.value)")})
        return URLRequest(url: (components?.url)!, timeoutInterval: 5)
    }
    
    private func buildPost(body:PostEncodeBody)->URLRequest{
        var request = URLRequest(url:URL(string: baseURL)!)
        request.httpMethod = "POST"
        request.setValue("application/form-data", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        return request
    }
    
    //MARK:-Comments Get
    func getCommentsAPI(callBy:CommentCallMethod...,completion:@escaping(Result<[CommentsData],Error>)->Void){
        let request = buildRequest(callBy: callBy)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error{
                completion(.failure(error))
            }
            if let data = data{
                do{
                    let decode = try JSONDecoder().decode([CommentsData].self, from: data)
                    completion(.success(decode))
                }catch{
                    completion(.failure(InternetError.invalidResponse))
                }
                
            }else{
                completion(.failure(InternetError.invalidData))
            }
        }.resume()
    }
    
    //MARK:-Comments Post
    func postCommentAPI(encodeData data:PostEncodeBody,completion:@escaping(Result<PostCommentsData,Error>)->Void){
        let request = buildPost(body: data)
        print("request:",request)
        URLSession.shared.dataTask(with: request) { data,_, error in
            if let error = error { completion(.failure(error)) }
            if let data = data {
                do{
                    let prettyJsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    print("解析資料：",prettyJsonData)
                }catch{
                    print("Error: Trying to convert JSON data to string")
                }
            }
        }.resume()
    }
}

extension CommentsAPI{
    enum CommentCallMethod{
        case wanna_Know_id(String)
        case content(String)
        case comment_id(String)
        case like(Bool)
        var parameter:[String:Any]{
            switch self{
            case .wanna_Know_id(let wanna_Know_id): return ["wanna_Know_id":wanna_Know_id]
            case .comment_id(let comment_id):       return ["comment_id":comment_id]
            case .content(let content):             return ["content":content]
            case .like(let like):                   return ["like":like]
            }
        }
    }
}




