//
//  DatabaseManager.swift
//  Devpet
//
//  Created by 강민석 on 2020/12/04.
//

import Foundation
import RealmSwift

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let realm: Realm
    
    private init() {
        realm = try! Realm()
    }
    
    func add<T: Object>(_ item: T) {
        do {
            try realm.write {
                realm.add(item)
            }
        } catch {
            print("Faild to add!")
        }
    }
    
    func remove<T: Object>(_ item: T) {
        do {
            try realm.write {
                realm.delete(item)
            }
        } catch {
            print("Faild to remove!")
        }
    }
    
    func searchByType<T: Object>(type: T) -> Results<T> {
        return realm.objects(T.self)
    }
}
