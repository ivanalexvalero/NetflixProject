//
//  NetworkError.swift
//  NetflixProject
//
//  Created by Ivan Valero on 22/09/2022.
//

import Foundation

enum NetworkError: String, Error{
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError
    case jsonDecoder
    case unauthorized
}
