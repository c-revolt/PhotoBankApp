//
//  NetworkDataFetcher.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 25.02.2023.
//

import Foundation

protocol NetworkDataFetcherProtocol {
    var networkService: NetworkServiceProtocol? { get }
    func fetchImagesFromSearchRequest(searchTerm: String, completion: @escaping (SearchResults?) -> ())
    func fetchListImagesRequest(completion: @escaping (SearchResults?) -> ())
}

final class NetworkDataFetcher: NetworkDataFetcherProtocol {
    
    var networkService: NetworkServiceProtocol?
    
    func fetchImagesFromSearchRequest(searchTerm: String, completion: @escaping (SearchResults?) -> ()) {
        guard let networkService = networkService else { fatalError() }
        networkService.searchRequest(searchTerm: searchTerm) { (data, error) in
            if let error = error {
                print("ERRRROOORRR\(error.localizedDescription)")
                completion(nil)
            }
            
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
            
        }
    }
    
    func fetchListImagesRequest(completion: @escaping (SearchResults?) -> ()) {
        guard let networkService = networkService else { fatalError() }
        networkService.listRequest { (data, error) in
            if let error = error {
                print("ERRRROOORRR\(error.localizedDescription)")
                completion(nil)
            }
            
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
            
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
