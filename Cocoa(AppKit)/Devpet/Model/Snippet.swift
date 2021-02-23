//
//  Snippet.swift
//  Devpet
//
//  Created by 강민석 on 2020/12/04.
//

import Foundation
import RealmSwift

class Snippet: Object {
    @objc dynamic var name = ""
    @objc dynamic var language = ""
    @objc dynamic var snippetDescription = ""
    @objc dynamic var isFavorite = false
    @objc dynamic var data = ""
    
    convenience init(name: String, language: String, description: String, data: String) {
        self.init()
        self.name = name
        self.language = language
        self.snippetDescription = description
        self.data = data
    }
}
