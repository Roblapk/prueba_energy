//
//  APIRouter.swift
//  test_energy
//
//  Created by Rogelio Bernal on 24/05/24.
//

import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible{

    case getAll
    
    private var urlPath: String{
        switch self{
            case .getAll:
                return "https://jsonplaceholder.typicode.com/todos"
        }
    }
    
    private var method: HTTPMethod{
        switch self{
        case .getAll:
            return .get
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try urlPath.asURL()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
}
