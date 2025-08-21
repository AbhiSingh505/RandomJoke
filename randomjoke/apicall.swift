//
//  apicall.swift
//  randomjoke
//
//  Created by Abhishek Singh Chouhan on 15/08/25.
//

import Foundation

enum err:Error{
    case invalidurl
    case invalidresponse
}
struct Joke: Codable, Identifiable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
