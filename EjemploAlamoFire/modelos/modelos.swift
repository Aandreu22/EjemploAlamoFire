//
//  modelos.swift
//  EjemploAlamoFire
//
//  Created by andreu navarro donderis on 24/01/2024.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categorias = try? JSONDecoder().decode(Categorias.self, from: jsonData)

import Foundation

// MARK: - Categorias
struct Categorias: Codable {
    let categories: [Category]
}

// MARK: - Category
struct Category: Codable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
// MARK: - Meals
struct Meals: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    let strCategory: String!
    let strArea: String!
    let strInstructions: String!
}


