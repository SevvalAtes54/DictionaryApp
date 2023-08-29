//
//  DictionaryData.swift
//  DictionaryApp
//
//  Created by Macbook Air on 23.08.2023.
//

import Foundation

struct DictionaryData : Codable{
    let word : String
    let phonetic : String
    let meanings : [Meanings]
    
}
struct Meanings : Codable {
    let partOfSpeech : String
    let definitions : [Definitions]
}
struct Definitions :Codable {
    
    let definition : String
}
