//
//  DessertDetailsViewModel.swift
//  FetchRewards
//
//  Created by Harjot Bhatia on 2/2/24.
//

import Foundation

extension DessertDetailView {
    final class ViewModel: ObservableObject {
        @Published var dessertDetails: DessertDetails
        private let dessertService: DessertService

        init(
            dessert: Dessert,
            recipeService: DessertService = DessertService()
        ) {
            self.dessertService = recipeService
            self.dessertDetails = DessertDetails(id: dessert.id, name: dessert.name, thumb: dessert.thumb)
        }

        func fetchRecipeDetails() async {
            do {
                let result = try await fetchDetails()
                await MainActor.run {
                    self.dessertDetails = result.recipes[0]
                }
            } catch {
                handleFetchError(error)
            }
        }

        // Fetching and processing the data
        private func fetchDetails() async throws -> DessertDetailResponse {
            try await dessertService.getDessertDetails(with: dessertDetails.id)
        }

        // Error handling
        private func handleFetchError(_ error: Error) {
            // Consider updating UI to reflect the error
            print("Error fetching dessert details: \(error.localizedDescription)")
        }
    }
}

