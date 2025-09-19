//
//  RecipeImageView.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/16/25.
//

import SwiftUI

//Need a custom image view instead of using async image since we're doing caching manually
struct RecipeImageView: View {
    let urlString: String
    @State private var image: UIImage?
    
    private let fetcher: ImageFetching
    
    init(fetcher: ImageFetching = ImageFetcher.shared, urlString: String) {
        self.fetcher = fetcher
        self.urlString = urlString
    }
    
    var body: some View {
        Group {
            if let uiImage = image {
                Image(uiImage: uiImage)
                    .resizable()
                    
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay(ProgressView())
                    .task {
                        image = await fetcher.fetchImage(from: urlString)
                    }
            }
        }
    }
}

#Preview {
    RecipeImageView(urlString: "")
}
