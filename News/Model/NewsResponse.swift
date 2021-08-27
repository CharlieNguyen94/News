//
//  NewsResponse.swift
//  NewsResponse
//
//  Created by Charlie Nguyen on 27/08/2021.
//

import Foundation

// MARK: - News Response
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData: Article {
        .init(author: "Vicky McKeever",
              url: "https://www.cnbc.com/2021/08/27/us-bonds-treasury-yields-rise-ahead-of-powells-fed-summit-speech.html",
              source: "CNBC",
              title: "Treasury yields rise slightly ahead of Powell's Fed summit speech - CNBC",
              articleDescription: "U.S. Treasury yields rose on Friday morning, ahead of Federal Reserve Chairman Jerome Powell's speech at the central bank's Jackson Hole symposium.",
              image: "https://image.cnbcfm.com/api/v1/image/106860253-16167820541965-ZH-OB-Photo-20210326-Press-8-jpg?v=1616782191",
              date: Date())
    }
}
