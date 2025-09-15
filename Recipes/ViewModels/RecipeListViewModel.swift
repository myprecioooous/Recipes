//
//  RecipeListViewModel.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/15/25.
//

import Foundation

class RecipeListViewModel: ObservableObject {
    @Published var recipeResponse: RecipesResponse = RecipesResponse(recipes: [])
        
    func loadRecipes() async throws {        
        let fetchedRecipe = try await RecipeFetcher.shared.fetchRecipes()
        recipeResponse = fetchedRecipe
    }
}
