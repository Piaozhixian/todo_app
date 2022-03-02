//
//  RealmTask.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/02.
//

import Foundation
import RealmSwift

class RealmTask: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
