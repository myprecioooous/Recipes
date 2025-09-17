//
//  EmptyView.swift
//  Recipes
//
//  Created by Precious Camille De Los Reyes on 9/17/25.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Image("EmptyList")
                .resizable()
                .scaledToFit()
            Text("No recipes available")
                .font(.headline)
                .foregroundStyle(.secondary)
            Spacer()
        }
    }
}

#Preview {
    EmptyView()
}
