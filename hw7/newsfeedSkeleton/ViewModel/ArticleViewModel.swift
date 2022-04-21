//
//  ArticleViewModel.swift
//  newsfeedSkeleton
//
//  Created by Grace Zhang on 4/7/22.
//

import Foundation
import Combine

protocol ArticleViewModel{
    func getArticles()
}

enum ResultState{
    case loading
    case faile(error: Error)
    case success(comtent: [Article])
}

class ArticleViewModelImpl: ObservableObject, ArticleViewModel{
    private let service: ArticleService
    
    private{set}; var articles = [Article]()
    @Published private(set) var state: ResultState = .loading
    
    private var cancellabels = Set<AnyCancellable>()
    
    init(service: ArticleService) {
        self.service = service
    }
    
    func getArticles(){
        self.state = .loading
        let cancellable = self.service
            .request(from: .getNews)
            .sink { (res) in
                switch res {
                case .failure(let error):
                    self.state = .failed(error: error)
                case .finished:
                    self.state = .success(comtent: self.articles)
                }
            } receiveValue: { res in
                self.articles = res.articles
            }
        self.cancellabels.insert(cancellable)
    }
}
