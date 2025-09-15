//
//  RecipeFetcher.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/15/25.
//

import SwiftUI

class RecipeFetcher {
    static let shared = RecipeFetcher()
    let baseURLStr = "https://d3jbb8n5wk0qxi.cloudfront.net/"
    let recipeFileName = "recipes.json"
    
    var recipeURLStr: String {
        baseURLStr + recipeFileName
    }
    
    func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: recipeURLStr) else {
            print("Throw an error here later")
            return[]
        }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode([Recipe].self, from: data)
        
    }
}
