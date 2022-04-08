//
//  ContentView.swift
//  newsfeedSkeleton
//
//  Created by Jordan Yee on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.openURL) var openURL
    @StateObject var ViewModel: ArticleViewModelImpl = ArticleViewModelImpl(service: ArticleServiceImpl())
    
    
    var body: some View {
        
        Group {
            
            switch ViewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error) {
                    self.ViewModel.getArticles()
                }
            case .success(let content):
                NavigationView {
                    List(content) { article in
                        ArticleView(article: article)
                            .onTapGesture {
                                load(url: article.url)
                            }
                    }
                    .navigationBarTitle("News")
                }
            }
        }
        .onAppear() {
            self.ViewModel.getArticles()
        }
    }
    
    func load(url: String?) {
        guard let url = url,
              let linkURL = URL(string: url) else {
            return
        }
        openURL(linkURL)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
