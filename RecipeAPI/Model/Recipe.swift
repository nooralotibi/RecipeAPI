//
//  Recipe.swift
//  RecipeAPI
//
//  Created by noor alotibi on 01/08/1445 AH.
//
// model represent Respose
import Foundation
struct RecipeResponse: Decodable {
    let results: [Recipe]
}

struct Recipe: Decodable, Identifiable {
    
    let id: Int
    let title: String
    let featuredImage: URL
    
    private enum CodingKeys: String, CodingKey {
        case title
        case featuredImage = "featured_image"
        case id = "pk"
    }
}

