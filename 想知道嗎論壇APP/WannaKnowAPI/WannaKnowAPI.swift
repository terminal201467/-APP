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
    private let baseURL = "https://script.google.com/macros/s/AKfycbyL_N-SK7iwC5Cwydj8gL1zQJxtK9Qf5wsc3HnjZFC-yo1wFKcHO9vyh_dQSh1H7s2I/exec"
    
    //MARK:-Methods
    private func buildReqeust(callBy:[WannaKnowCallMethod])->URLRequest{
        var components = URLComponents(string: baseURL)
        var query:[String:Any] = [:]
        callBy.map{$0.parameter.map{query[$0.key] = $0.value}}
        components?.queryItems = query.map({URLQueryItem(name: $0.key, value: "\($0.value)")})
        return URLRequest(url: components!.url!, timeoutInterval: 10)
    }
    
    private func baseURLRequest()->URLRequest{
        let components = URLComponents(string: baseURL)
        return URLRequest(url: components!.url!, timeoutInterval: 10)
    }

    public func getBaseURL(completion:@escaping(Result<[YearData],Error>)->Void){
        URLSession.shared.dataTask(with: baseURLRequest()){ data, _, error in
            if let error = error{
                completion(.failure(error))
            }
            if let data = data{
                do{
                    let decode = try JSONDecoder().decode([YearData].self, from: data)
                    completion(.success(decode))
                }catch{
                    completion(.failure(error))
                }
            }else{
                completion(.failure(InternetError.requestFailed))
            }
        }.resume()
    }
    
    public func getWannaKnowData(callBy:WannaKnowCallMethod...,completion: @escaping(Result<WannaKnowData,Error>)->Void){
        let request = buildReqeust(callBy:callBy)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error{
                completion(.failure(error))
            }
            if let data = data{
                do{
                    let decode = try JSONDecoder().decode(WannaKnowData.self, from: data)
                    completion(.success(decode))
                }catch{
                    completion(.failure(error))
                }
            }else{
                completion(.failure(InternetError.requestFailed))
            }
        }.resume()
    }
    
    public func getYearData(callBy:WannaKnowCallMethod...,completion:@escaping(Result<[YearData],Error>)->Void){
        let request = buildReqeust(callBy: callBy)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error{
                completion(.failure(error))
            }
            if let data = data{
                do{
                    let decode = try JSONDecoder().decode([YearData].self, from: data)
                    completion(.success(decode))
                }catch{
                    completion(.failure(error))
                }
            }else{
                completion(.failure(InternetError.requestFailed))
            }
        }.resume()
    }
}

extension WannaKnowAPI{
    enum WannaKnowCallMethod{
        case tags(String)
        case category(String)
        case page(String)
        case per_page(String)
        case year(String)
        case orderby(String)
        case keyword(String)
        var parameter:[String:Any]{
            switch self {
            case .tags(let tags):
                return ["tags":tags]
            case .category(let category):
                return ["category":category]
            case .page(let page):
                return ["page":page]
            case .per_page(let per_page):
                return ["per_page":per_page]
            case .year(let year):
                return ["year":year]
            case .orderby(let orderby):
                return ["orderby":orderby]
            case .keyword(let keyword):
                return ["keyword":keyword]
            }
        }
    }
}
