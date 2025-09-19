//
//  RecipeFetcher.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/15/25.
//

import SwiftUI

protocol RecipeFetching {
    func fetchRecipes() async throws -> RecipesResponse
}

//Fetches JSON
final class RecipeFetcher: RecipeFetching {
    
    static let shared = RecipeFetcher()
    
    private let baseURLStr = "https://d3jbb8n5wk0qxi.cloudfront.net/"
    private let recipesFileName = "recipes.json"
    private let recipesMalformedFileName = "recipes-malformed.json"
    private let recipesmptyFileName = "recipes-empty.json"
    
    var recipeURLStr: String {
        baseURLStr + recipesFileName
        //baseURLStr + recipesMalformedFileName
        //baseURLStr + recipesmptyFileName
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
