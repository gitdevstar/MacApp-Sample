//
//  Book.swift
//  test
//
//  Created by brian on 6/3/21.
//

import Foundation

struct Book {
    var title: String?
    var date: String?
    var description: String?
    
    init(fromDictionary dictionary: [String: Any]) {
        title = dictionary["title"] as? String
        date = dictionary["date"] as? String
        description = dictionary["description"] as? String
    }
}
