//
//  RecipeFetcher.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/15/25.
//

import SwiftUI

final class RecipeFetcher {
    static let shared = RecipeFetcher()
    
    private let baseURLStr = "https://d3jbb8n5wk0qxi.cloudfront.net/"
    private let recipeFileName = "recipes.json"
    
    var recipeURLStr: String {
        baseURLStr + recipeFileName
    }
    
    func fetchRecipes() async throws -> RecipesResponse {
        guard let url = URL(string: recipeURLStr) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(RecipesResponse.self, from: data)
        
    }
}
