//
//  NetworkService.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 17.02.2023.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func searchRequest(searchTerm: String, completion: (Data?, Error?) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func searchRequest(searchTerm: String, completion: (Data?, Error?) -> Void) {
        let parameters = self.prepareSearchParameters(searchTerm: searchTerm)
        let url = self.url(params: parameters)
    }
    
    private func prepareSearchParameters(searchTerm: String?) -> [String: String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(2)
        parameters["per_page"] = String(45)
        return parameters
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        guard var url = components.url else { fatalError() }
        return url
    }
    
    
}
