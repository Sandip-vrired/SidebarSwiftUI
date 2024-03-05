//
//  JsonDataClient.swift
//  SandipTest
//
//  Created by Sandip on 05/03/24.
//

import Foundation
import SwiftUI
import Combine

enum FileExtensionType: String {
    case json = ".json"
}

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    case badImage
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        case .badImage:
            return "Bad Image"
        default:
            return "Unknown error"
        }
    }
}

protocol JsonFileHandler: AnyObject {
    var bundle: Bundle { get }
    func loadJson<T: Decodable>(filename: String,
                                extensionType: FileExtensionType,
                                responseModel: T.Type) -> Result<T, RequestError>  where T : Decodable
}

extension JsonFileHandler {
    var bundle: Bundle {
        Bundle(for: type(of: self) )
    }
    
    func loadJson<T: Decodable>(filename: String,
                                extensionType: FileExtensionType,
                                responseModel: T.Type) -> Result<T, RequestError> {
        guard let path = bundle.url(forResource: filename,
                                    withExtension: extensionType.rawValue) else {
            return .failure(.invalidURL)
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedObject)
        } catch {
            print(error)
            return .failure(.unknown)
        }
    }
}

