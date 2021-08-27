//
//  NewsViewModel.swift
//  NewsViewModel
//
//  Created by Charlie Nguyen on 27/08/2021.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}

class NewsViewModelImplementation: ObservableObject, NewsViewModel {
    
    private let service: NewsService
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { result in
                switch result {
                    
                case .finished:
                    self.state = .success(content: self.articles)
                    // Send back the articles
                    
                case .failure(let error):
                    // Send back the error
                    self.state = .failed(error: error)
                    
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        self.cancellables.insert(cancellable)
    }
}
