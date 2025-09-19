//
//  RecipeListViewModel.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/15/25.
//

import Foundation

//AnyObject tells SwiftUI that only class types can conform.
protocol RecipeListViewModeling: AnyObject, ObservableObject {
    var recipeResponse: RecipesResponse { get }
    func loadRecipes() async throws
}

class RecipeListViewModel: RecipeListViewModeling {
    @Published private(set) var recipeResponse: RecipesResponse = RecipesResponse(recipes: [])
    
    private let fetcher: RecipeFetching
    
    init(fetcher: RecipeFetching = RecipeFetcher.shared) {
        self.fetcher = fetcher
    }
        
    func loadRecipes() async throws {        
        let fetchedRecipe = try await fetcher.fetchRecipes()
        recipeResponse = fetchedRecipe
    }
}
