//
//  TasksView.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/02.
//

import SwiftUI
import RealmSwift

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
            VStack {
                ListBar()
                    .frame(height: 35)
                    .environmentObject(UserData())
                Divider()
                List {
                    ForEach(realmManager.tasks, id: \.id) {
                        task in
                        if !task.isInvalidated {
                            
                            TaskRow(task: task.title, completed: task.completed)
                                .onTapGesture {
                                    realmManager.updateTask(id: task.id, completed: !task.completed)
                                }
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        realmManager.deleteTask(id: task.id)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                        
                    }
                    .listRowSeparator(.hidden)
                }
                .onAppear{
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle(Text("ToDo List").font(.largeTitle), displayMode: .inline)
            .navigationBarItems(trailing: Image(systemName: "person.circle").font(.title))
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
