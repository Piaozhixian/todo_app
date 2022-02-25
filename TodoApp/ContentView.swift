//
//  ContentView.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/02/14.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            List {
                ForEach(userData.tasks) {task in
                    Button(action: {
                        guard let index = self.userData.tasks.firstIndex(of: task) else {
                            return
                        }
                        self.userData.tasks[index].checked.toggle()
                    })
                    {
                        ListRow(task: task.title, isCheck: task.checked)
                    }
                }
                if self.userData.isEditing {
                    Draft()
                } else {
                    Button(action: {
                        self.userData.isEditing = true
                    })
                    {
                        Text("+").font(.title)
                    }
                }
                Button("Delete all tasks") {
                    showAlert = true
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Unable to Save Workout Data"),
                        message: Text("The connection to the server was lost."),
                        primaryButton: .default(
                            Text("Cancel")
                        ),
                        secondaryButton: .destructive(
                            Text("Delete"),
                            action: DeleteTask
                        )
                    )
                }
                
            }
            .navigationBarTitle(Text("Tasks"))
            .navigationBarItems(trailing: Button(action: {
                DeleteTask()
            })
            {
                Text("Delete")
            }
            )
        }
    }
    
    func DeleteTask() {
        let necessaryTask = self.userData.tasks.filter({!$0.checked})
        self.userData.tasks = necessaryTask
    }

    func DeleteAllTasks() {
        self.userData.tasks = []
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
