//
//  CharacterModel.swift
//  rickandmorty
//
//  Created by Kell Lanes on 29/08/21.
//

import Foundation

struct CharacterModel: Decodable {
  let name: String
  let status: String
  let species: String
  let type: String
  let gender: String
  let image: String
  let episode: [String]
  let url: String
  let created: String
  
  init(name: String, status: String, species: String, type: String, gender: String, image: String, episode: [String], url: String, created: String) {
    
    self.name = name
    self.status = status
    self.species = species
    self.type = type
    self.gender = gender
    self.image = image
    self.episode = episode
    self.url = url
    self.created = created
  }
}

struct Results: Decodable {
  let results: [CharacterModel]
}
