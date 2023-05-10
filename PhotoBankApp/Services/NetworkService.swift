//
//  NetworkService.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 17.02.2023.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func listRequest(completion: @escaping (Data?, Error?) -> Void)
    func searchRequest(searchTerm: String, completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    // MARK: - ListPhotos
    func listRequest(completion: @escaping (Data?, Error?) -> Void) {
        let parameters = self.prepareListParameters()
        let url = self.listUrl(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareListHeader()
        request.httpMethod = "get"
        let task = createListDataTask(from: request, competion: completion)
        task.resume()
    }
    
    private func prepareListParameters() -> [String: String] {
        var parameters = [String: String]()
        parameters["page"] = String(1)
        parameters["per_page"] = String(45)
        parameters["order_by"] = "latest"
        return parameters
    }
    
    private func prepareListHeader() -> [String : String] {
        var headers = [String : String]()
        headers["Authorization"] = K.apiKey
        return headers
    }
    
    private func listUrl(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        guard var url = components.url else { fatalError() }
        return url
    }
    
    private func createListDataTask(from listRequest: URLRequest,
                                    competion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
      return URLSession.shared.dataTask(with: listRequest) { (data, response, error) in
          DispatchQueue.main.async {
              competion(data, error)
          }
      }
  }

    
    // MARK: - SearchRequest
    func searchRequest(searchTerm: String, completion: @escaping (Data?, Error?) -> Void) {
        let parameters = self.prepareSearchParameters(searchTerm: searchTerm)
        let url = self.searchUrl(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareSearchHeader()
        request.httpMethod = "get"
        let task = createSerachDataTask(from: request, competion: completion)
        task.resume()
        
    }
    
    func prepareSearchHeader() -> [String: String] {
        var headers = [String: String]()
        headers["Authorization"] = K.apiKey
        return headers
    }
    
    private func prepareSearchParameters(searchTerm: String?) -> [String: String] {
        var parameters = [String: String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(45)
        return parameters
    }
    
    private func searchUrl(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        guard var url = components.url else { fatalError() }
        return url
    }
    
    private func createSerachDataTask(from searchRequest: URLRequest,
                                      competion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: searchRequest) { (data, response, error) in
            DispatchQueue.main.async {
                competion(data, error)
            }
        }
    }
    
    
    
}
