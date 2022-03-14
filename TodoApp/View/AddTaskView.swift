//
//  AddTaskView.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/02.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var userData: UserData
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(userData.selectedTaskList!.title)
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter you task here",
                      text: $title)
                .textFieldStyle(.roundedBorder)
            Button {
                if title != "" {
                    realmManager.addTask(taskTitle: title, taskList: userData.selectedTaskList!)
                }
                dismiss()
            } label: {
                Text("Add task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.3, saturation: 0.8, brightness: 0.4))
                    .cornerRadius(30)
            }
            Spacer()

        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(.white)
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
