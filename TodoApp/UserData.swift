//
//  userData.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/07.
//

import Foundation
import RealmSwift

class UserData: ObservableObject {
    @Published var selectedTaskList: TaskList?
    var realmManager = RealmManager()


    init () {
        if self.selectedTaskList == nil {
            if !self.realmManager.taskLists.isEmpty {
                self.selectedTaskList = self.realmManager.taskLists[0]
            }
        }
    }
}
