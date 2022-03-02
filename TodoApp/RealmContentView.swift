//
//  ContentView.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/02/14.
//

import SwiftUI
import RealmSwift

struct RealmContentView: View {
    @EnvironmentObject var userData: UserData
    @

    @State private var showAlert = false
    
    var body: some View {
        ZStack {
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
                   
                    Button("Delete all tasks") {
                        showAlert = true
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("全部のタスクを削除しますか？"),
                            primaryButton: .cancel(
                                Text("キャンセル")
                            ),
                            secondaryButton: .destructive(
                                Text("削除"),
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
            if self.userData.showAddTaskAlert {
                AddTaskAlert()
            }
            FloatingButton()
            
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
