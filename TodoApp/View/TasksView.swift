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
    
    var body: some View {
        VStack {
            Text("My Tasks")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            List {
                ForEach(realmManager.tasks, id: \.id) {
                    task in
                    TaskRow(task: task.title, completed: task.completed)
                }
            }
            .onAppear{
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.08, saturation: 0.14, brightness: 0.97))
        
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
