//
//  RecipeListViewModel.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/15/25.
//

import Foundation

class RecipeListViewModel: ObservableObject {
    @Published var recipeResponse: RecipesResponse = RecipesResponse(recipes: [])
    
    private let fetcher: RecipeFetching
    
    init(fetcher: RecipeFetching = RecipeFetcher.shared) {
        self.fetcher = fetcher
    }
        
    func loadRecipes() async throws {        
        let fetchedRecipe = try await fetcher.fetchRecipes()
        recipeResponse = fetchedRecipe
    }
}
