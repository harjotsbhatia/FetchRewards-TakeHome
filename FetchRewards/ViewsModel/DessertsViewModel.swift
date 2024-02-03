//
//  DessertsViewModel.swift
//  FetchRewards
//
//  Created by Harjot Bhatia on 2/2/24.
//

import Foundation

extension DessertsView {
    final class ViewModel: ObservableObject {
        @Published var desserts: [Dessert] = []
        private let recipeService: DessertService

        // Dependency Injection for easier testing and flexibility
        init(recipeService: DessertService = DessertService()) {
            self.recipeService = recipeService
        }

        // Public function to fetch recipes
        func fetchDesserts() async {
            do {
                let sortedList = try await fetchAndSortRecipes()
                await MainActor.run {
                    self.desserts = sortedList
                }
            } catch {
                
                handleFetchError(error)
            }
        }

        // Private function to fetch and sort desserts
        private func fetchAndSortRecipes() async throws -> [Dessert] {
            let dessertsResponse = try await recipeService.getDessertList()
            return dessertsResponse.desserts.sorted(by: { $0.name < $1.name })
        }

        // Error handling function, can be expanded to handle different types of errors
        private func handleFetchError(_ error: Error) {
            // Log the error or update the UI to reflect the error state
            print("Error fetching desserts: \(error.localizedDescription)")
        }
    }
}

