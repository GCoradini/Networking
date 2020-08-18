//
//  Post.swift
//  NetworkingBasics
//
//  Created by Usuario on 18/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation

final class Post : Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "userID"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}
