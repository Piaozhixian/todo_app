//
//  AddTaskAlert.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/02/28.
//

import SwiftUI

struct AddTaskAlert: View {
    @EnvironmentObject var userData: UserData
    @State var taskTitle = ""

    var body: some View {
        ZStack() {
            Rectangle()
                .foregroundColor(.white)
            VStack {
                TextField("テキスト",text: $taskTitle)
                HStack {
                    Button("追加") {
                        createTask()
                        self.userData.showAddTaskAlert.toggle()
                    }
                }
            }.padding()
        }
        .frame(width: 300, height: 180,alignment: .center)
        .cornerRadius(20).shadow(radius: 20)
    }
    
    func createTask() {
        let newTask = Task(title: self.taskTitle, checked: false)
        self.userData.tasks.insert(newTask, at: 0)
        self.taskTitle = ""
    }
}

struct AddTaskAlert_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskAlert()
    }
}
