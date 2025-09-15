//
//  RecipesView.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/12/25.
//

/*
 App:
    - build a recipe app that displays recipes from the provided API endpoint
 
 Requirements:
    - At a minimum, each recipe should show its name, photo, and cuisine type
    - allow users to refresh the list of recipes at any time
    - Use async / await for all asynchronous operations
    - No third-party libraries for ui, networking, image caching, or testing.
    - Cache - Load images only when needed in the UI to avoid unnecessary bandwidth consumption
        - Cache images to disk to minimize repeated network requests
        - Implement the disk cache manually.
        - Do not use the URLSession built-in HTTP cache setup or the URLCache implementation.
    - Test - Include unit tests to demonstrate your approach to testing.
        - Focus on testing the core logic of your app (e.g., data fetching, image caching, business logic)
 
    Endpoints:
        All Recipes: https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json
        Malformed Data: https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json
        Empty Data: https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json
 
    - If a recipe is malformed, your app should disregard the entire list of recipes and handle the error gracefully.
    - If the recipe list is empty, the app should display an empty state to inform users that no recipes are available.

 
 Breakdown:
    - The app should consist of at least one screen displaying a list of recipes
    - Cache images - only load when necessary
    - Use coding keys to encode and decode
 
 Fix Later / Good To have:
    - Second Screen for recipe detail
    - Additinal Features
    - Add a README.md
    
    
*/

import SwiftUI

struct RecipesListView: View {
    @ObservedObject private var viewModel = RecipeListViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.recipeResponse.recipes) { recipe in
                HStack(alignment: .top) {
                    AsyncImage(url: URL(string: recipe.imageURLSmall))
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text(recipe.name)
                            .font(.title3)
                        Text(recipe.cuisine)
                            .foregroundStyle(.gray)
                    }
                    .padding()
                }
                
            }
            .navigationTitle("Recipes")
            .task {
                do {
                    try await viewModel.loadRecipes()
                    print("Here are the recipes \(viewModel.recipeResponse.recipes)")
                } catch {
                    print("There's an error with fetching. \(error.localizedDescription)")
                }
            }
        }
        
    }
}

#Preview {
    RecipesListView()
}
