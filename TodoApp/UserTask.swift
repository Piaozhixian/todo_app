//
//  UserTask.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/02/17.
//

import SwiftUI

struct Task: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var checked: Bool
    
    init(title: String, checked: Bool) {
        self.title = title
        self.checked = checked
    }
}
