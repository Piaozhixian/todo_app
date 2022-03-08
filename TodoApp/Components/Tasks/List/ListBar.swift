//
//  ListBar.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/04.
//

import SwiftUI

struct ListBar: View {
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        HStack {
            ScrollView([.horizontal], showsIndicators: false) {
                HStack {
                    ListNameTab(name: "My tasks", selected: true)
                    ForEach(realmManager.taskLists, id: \.id) { taskList in
                        ListNameTab(name: taskList.title)
                            .onTapGesture {
                                userData.selectedTaskList = realmManager.getTaskListById(id: taskList.id)
                                if let selectedTaskList = userData.selectedTaskList {
                                    print(selectedTaskList)
                                }
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
