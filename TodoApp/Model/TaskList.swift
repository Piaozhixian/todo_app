//
//  List.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/06.
//

import Foundation
import RealmSwift

class TaskList: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
}
