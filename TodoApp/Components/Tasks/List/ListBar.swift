//
//  ListBar.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/04.
//

import SwiftUI
import RealmSwift

struct ListBar: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        HStack {
            ScrollView([.horizontal], showsIndicators: false) {
                HStack {
                    ListNameTab(taskList: TaskList(value:  ["title": "myTask"]))
                    if let tmpTaskList = userData.selectedTaskList {
                        ForEach(realmManager.taskLists, id: \.id) { taskList in
                            if tmpTaskList.id == taskList.id {
                                ListNameTab(taskList: taskList, showUnderScore: true)
                            } else {
                                ListNameTab(taskList: taskList, showUnderScore: false)
                            }
                        }
                    } else {
                        ForEach(realmManager.taskLists, id: \.id) { taskList in
                            ListNameTab(taskList: taskList, showUnderScore: false)
                        }
                    }
                    
                }
            }
            AddListTab()
            
        }
        
    }
    
}

struct ListBar_Previews: PreviewProvider {
    static var previews: some View {
        ListBar()
    }
}
