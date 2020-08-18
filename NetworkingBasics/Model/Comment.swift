//
//  Comment.swift
//  NetworkingBasics
//
//  Created by Usuario on 18/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

final class Comment : Codable {
    let id: Int?
    let name: String?
    let body: String?
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case body = "body"
        case email = "email"
    }
}
