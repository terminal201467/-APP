//
//  WannaKnowAPI.swift
//  想知道嗎論壇APP
//
//  Created by Jhen Mu on 2022/2/16.
//

import Foundation


class WannaKnowAPI{
    
    static let shared = WannaKnowAPI()
    
    //MARK:-Properties
    private let baseURL = "https://script.google.com/macros/s/AKfycbzPLRjMxBrvgLJhlHXSHxCw1LxQkIfTV045d8_UfkPo6jcWoZPerLsVJsQYMbJAylqs/exec"
    
    //MARK:-Methods
    private func buildReqeust(callBy:[CallMethod])->URLRequest{
        var components = URLComponents(string: baseURL)
        var query:[String:Any] = [:]
        callBy.map{$0.parameter.map{query[$0.key] = $0.value}}
        components?.queryItems = query.map({URLQueryItem(name: $0.key, value: "\($0.value)")})
        return URLRequest(url: components!.url!, timeoutInterval: 10)
    }
    
    public func getCurrentData(callBy:CallMethod...,completion: @escaping(Result<[WannaKnowData],Error>)->Void){
        let request = buildReqeust(callBy:callBy)
        print(request)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error{
                completion(.failure(error))
            }
            if let data = data{
                do{
                    let decode = try JSONDecoder().decode([WannaKnowData].self, from: data)
                    completion(.success(decode))
                    print(data)
                }catch{
                    completion(.failure(error))
                }
            }else{
                completion(.failure(InternetError.requestFailed))
            }
        }.resume()
    }
}
