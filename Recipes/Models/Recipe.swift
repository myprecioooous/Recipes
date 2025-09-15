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
    let imageURLSmall: String
    let cuisine: String
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name
        case imageURLSmall = "photo_url_small"
        case cuisine
    }
}

struct RecipesResponse: Codable {
    let recipes: [Recipe]
}

struct MockData {
    static let recipeSample = Recipe(id: UUID(), name: "Banana Pancakes", imageURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg", cuisine: "American")
    
    static let recipes = [recipeSample, recipeSample, recipeSample, recipeSample, recipeSample]
}
