//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by Александр Мехович on 12/11/19.
//  Copyright © 2019 AlexMex. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
