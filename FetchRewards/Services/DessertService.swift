//
//  DessertService.swift
//  FetchRewards
//
//  Created by Harjot Bhatia on 2/2/24.
//

import Foundation

final class DessertService {
    func fetch<T: Decodable>(url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }

    func getDessertList() async throws -> DessertResponse {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        return try await fetch(url: url)
    }

    func getDessertDetails(with id: String) async throws -> DessertDetailResponse {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
        return try await fetch(url: url)
    }
}

