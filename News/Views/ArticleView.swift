//
//  ArticleView.swift
//  ArticleView
//
//  Created by Charlie Nguyen on 27/08/2021.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            
            if let imageURL = article.image,
               let url = URL(string: imageURL) {
                
                URLImage(url,
                         failure: { error, _ in
                    PlaceholderImageView()
                    
                },
                         content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                })
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(10)
                    .environment(\.urlImageOptions, URLImageOptions(fetchPolicy: .returnStoreElseLoad(downloadDelay: 1), loadOptions: .loadOnAppear, urlRequestConfiguration: .init(cachePolicy: .returnCacheDataElseLoad), maxPixelSize: CGSize(width: 600.0, height: 600.0)))
            } else {
                PlaceholderImageView()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            
        }
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            
    }
}
