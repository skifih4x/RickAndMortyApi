//
//  Characters.swift
//  RickAndMortyApi
//
//  Created by Артем Орлов on 27.06.2022.
//

struct Characters: Decodable {
    let name: String?
    let species: String?
    let gender: String?
    let image: String?
}

struct Result: Decodable {
    let results: [Characters]
}

enum Link: String {
    case urlString = "https://rickandmortyapi.com/api/character"
}
