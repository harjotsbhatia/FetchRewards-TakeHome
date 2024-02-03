//
//  DessertDetailsView.swift
//  FetchRewards
//
//  Created by Harjot Bhatia on 2/2/24.
//

import SwiftUI

struct DessertDetailView: View {
    @StateObject var viewModel: ViewModel
        private let imageHeight: CGFloat = 300
        private let collapsedImageHeight: CGFloat = 100 // Smaller strip height when scrolled

        var body: some View {
            ScrollView {
                VStack(spacing: 0) {
                    GeometryReader { geometry in
                        recipeImage(geometry)
                            .frame(height: newImageHeight(geometry))
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [.clear, .white]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                .opacity(whiteOverlayOpacity(geometry))
                            )
                    }
                    .frame(height: imageHeight)

                    recipeContent
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchRecipeDetails()
            }
        }

        private func recipeImage(_ geometry: GeometryProxy) -> some View {
            AsyncImage(url: viewModel.dessertDetails.thumb) { phase in
                switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                             .scaledToFill()
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                }
            }
        }

        private var recipeContent: some View {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.dessertDetails.name)
                    .font(.largeTitle)
                    .padding(.top)

                Text("Instructions")
                    .font(.headline)
                Text(viewModel.dessertDetails.instructions)
                    .font(.body)
                Divider()
                Text("Ingredients")
                    .font(.headline)
                ingredientsList
            }
            .padding()
        }

        private var ingredientsList: some View {
            ForEach(viewModel.dessertDetails.ingredients) { element in
                HStack {
                    Text(element.ingredient)
                        .font(.body)
                        .frame(width: 120, alignment: .leading)
                    Spacer()
                    Text(element.measure)
                        .font(.body)
                        .frame(alignment: .trailing)
                }
            }
        }

        private func newImageHeight(_ geometry: GeometryProxy) -> CGFloat {
            let scrollOffset = geometry.frame(in: .global).minY
            let adjustedHeight = imageHeight - scrollOffset
            return min(max(collapsedImageHeight, adjustedHeight),800)
        }

        private func whiteOverlayOpacity(_ geometry: GeometryProxy) -> Double {
            let scrollOffset = -geometry.frame(in: .global).minY
            let opacity = scrollOffset / (imageHeight - collapsedImageHeight)
            return min(max(opacity, 0), 1)
        }
    }

    

