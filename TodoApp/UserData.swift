//
//  UserData.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/02/17.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var tasks = [
        Task(title: "散歩", checked: true),
        Task(title: "料理", checked: false),
        Task(title: "筋トレ", checked: true),
    ]
    
    @Published var isEditing: Bool = false
    @Published var showAddTaskAlert: Bool = false
}
