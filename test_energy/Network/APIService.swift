//
//  APIService.swift
//  test_energy
//
//  Created by Rogelio Bernal on 24/05/24.
//

import Foundation

protocol APIServiceProtocol{
    func getAll(completionBlock: @escaping(Result<[AllModel], NetworkError>) -> Void)
}

class APIService: APIServiceProtocol{
    
    func getAll(completionBlock: @escaping (Result<[AllModel], NetworkError>) -> Void) {
        RestAPIClient.getAll(completionBlock: completionBlock)
    }
    
}
