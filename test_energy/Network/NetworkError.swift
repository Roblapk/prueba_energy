//
//  NetworkError.swift
//  test_energy
//
//  Created by Rogelio Bernal on 24/05/24.
//

import Foundation

enum NetworkError: Error{
    case BadURL
    case NoData
    case DecodingError
    case APIError(String)
}
