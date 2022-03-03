//
//  TaskRow.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/02.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack() {
            Image(systemName: completed ? "checkmark.circle" : "circle")
            Text(task)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity)
        
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "Do laundry", completed: false)
    }
}
