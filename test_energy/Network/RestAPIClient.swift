//
//  RestAPIClient.swift
//  test_energy
//
//  Created by Rogelio Bernal on 24/05/24.
//

import Foundation
import Alamofire

class RestAPIClient{
    
    static func request<T: Codable>(type: T.Type, url: APIRouter, completionBlock: @escaping(Result<T, NetworkError>) -> Void){
        AF.request(url).response{ response in
            let result = response.result
            switch result{
            case .success(let data):
                
                guard let data = data else {
                    completionBlock(.failure(.NoData))
                    return
                }
                guard let jsonObj = try? JSONDecoder().decode(T.self, from: data) else{
                    completionBlock(.failure(.DecodingError))
                    return
                }
                
                completionBlock(.success(jsonObj))
                
            case .failure(let error):
                completionBlock(.failure(.APIError(error.localizedDescription)))
            }
        }
    }
    
    static func getAll(completionBlock: @escaping(Result<[AllModel], NetworkError>) -> Void){
        
        return request(type: [AllModel].self, url: APIRouter.getAll, completionBlock: completionBlock)
        
    }
    
}
