//
//  CommentsAPI.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/25.
//

import Foundation

class CommentsAPI{
    
    static let shared = CommentsAPI()
    
    private let baseURL = "https://script.google.com/macros/s/AKfycbwNKoMxg2VJP4dXk4iAGRxsnUIEySV7r3WOm7gWHb7rbiZW2t3DAEmlCWW1QfHFj_Fu3Q/exec"
    
    private func buildRequest(callBy ID:String)->URLRequest{
        var components = URLComponents(string: baseURL)
        let query:[String:String] = ["wanna_know_id":ID]
        components?.queryItems = query.map({URLQueryItem(name: $0.key,value:$0.value)})
        return URLRequest(url: (components?.url)!, timeoutInterval: 10)
    }
    
    func getCommentsAPI(callBy ID:String,completion:@escaping(Result<[WannaKnowData],Error>)->Void){
        let request = buildRequest(callBy: ID)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error{
                completion(.failure(error))
            }
            if let data = data{
                do{
                    let data = try JSONDecoder().decode([WannaKnowData].self, from: data)
                    completion(.success(data))
                }catch{
                    completion(.failure(InternetError.invalidResponse))
                }
                
            }else{
                completion(.failure(InternetError.invalidData))
            }
        }.resume()
    }
}


