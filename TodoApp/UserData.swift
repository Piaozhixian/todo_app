//
//  userData.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/07.
//

import Foundation
import RealmSwift

class UserData: ObservableObject {
    @Published var selectedTaskListId: ObjectId?
    @Published var selectedTaskList: TaskList?
    
}
