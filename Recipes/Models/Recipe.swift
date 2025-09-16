//
//  Recipe.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/12/25.
//

import Foundation

struct Recipe: Codable, Identifiable {
    let id: UUID
    let name: String
    let imageURLSmall: String?
    let imageURLLarge: String?
    let cuisine: String
    let sourceURL: String?
    let youtubeURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name
        case imageURLSmall = "photo_url_small"
        case imageURLLarge = "photo_url_large"
        case cuisine
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
}

struct RecipesResponse: Codable {
    let recipes: [Recipe]
}

struct MockData {
    static let recipeSample = Recipe(
        id: UUID(),
        name: "Banana Pancakes",
        imageURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg",
        imageURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg",
        cuisine: "American",
        sourceURL: "https://www.bbcgoodfood.com/recipes/banana-pancakes",
        youtubeURL: "https://www.youtube.com/watch?v=kSKtb2Sv-_U"
    )
    
    static let recipes = [recipeSample, recipeSample, recipeSample, recipeSample, recipeSample]
}
