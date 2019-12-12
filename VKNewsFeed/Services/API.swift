//
//  API.swift
//  VKNewsFeed
//
//  Created by Александр Мехович on 12/10/19.
//  Copyright © 2019 AlexMex. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.103"
    
    static let newsFeed = "/method/newsfeed.get"
    static let user = "/method/users.get"
}
