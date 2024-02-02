//
//  DessertsModel.swift
//  FetchRewards
//
//  Created by Harjot Bhatia on 2/2/24.
//

import Foundation

struct Dessert: Identifiable, Hashable {
    let name: String
    let id: String
    let thumb: URL

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(String.self, forKey: .id)
        thumb = try container.decode(URL.self, forKey: .thumb)
    }

    private enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case id = "idMeal"
        case thumb = "strMealThumb"
    }
}

extension Dessert: Decodable {}

struct DessertResponse: Decodable {
    let desserts: [Dessert]

    private enum CodingKeys: String, CodingKey {
        case desserts = "meals"
    }
}
