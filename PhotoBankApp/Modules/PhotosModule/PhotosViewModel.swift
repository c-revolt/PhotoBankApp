//
//  PhotosViewModel.swift
//  PhotoBankApp
//
//  Created by Александр Прайд on 12.02.2023.
//

import Foundation

protocol PhotosViewModelProtocol: AnyObject {
    init(view: PhotosViewControllerProtocol, networkDataFetcher: NetworkDataFetcherProtocol, coordinator: CoordinatorProtocol)
    var photos: [Photo]? { get set }
    func getData(searchText: String)
    func getListData()
    
}

final class PhotosViewModel: PhotosViewModelProtocol {
    
    weak var view: PhotosViewControllerProtocol?
    var networkDataFetcher: NetworkDataFetcherProtocol?
    var coordinator: CoordinatorProtocol?
    var photos: [Photo]?
    
    init(view: PhotosViewControllerProtocol, networkDataFetcher: NetworkDataFetcherProtocol, coordinator: CoordinatorProtocol) {
        self.view = view
        self.networkDataFetcher = networkDataFetcher
        self.coordinator = coordinator
        
    }
    
    func getData(searchText: String) {
        networkDataFetcher?.fetchImagesFromSearchRequest(searchTerm: searchText, completion: { (searchResults) in
            searchResults?.results.map({ (photo) in
                print(photo)
            })
        })
    }
    
    func getListData() {
        networkDataFetcher?.fetchListImagesRequest(completion: { (listReuslts) in
            listReuslts?.results.map({ (photos) in
                print(photos)
            })
        })
    }
    
    
    
}

