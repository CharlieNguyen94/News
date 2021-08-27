//
//  HomeView.swift
//  HomeView
//
//  Created by Charlie Nguyen on 27/08/2021.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.openURL) var openURL
    
    @StateObject var viewModel = NewsViewModelImplementation(service: NewsServiceImplementation())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles):
                NavigationView {
                    List(articles) { item in
                        ArticleView(article: item)
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }
                    navigationTitle("News")
                }
            }
        }
        .onAppear(perform: viewModel.getArticles)
    }
    
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else { return }
        
        openURL(url)
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
