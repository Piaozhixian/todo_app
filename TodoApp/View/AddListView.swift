//
//  AddListView.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/04.
//

import SwiftUI

struct AddListView: View {
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var realmManager: RealmManager
    @EnvironmentObject var userData: UserData
    @State private var enableAddTaskBtn = false

    var body: some View {
        VStack {
            TextField("リストのタイトルを入力", text: $title)
                .padding()
                .navigationBarTitle("新しいリストを作成", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    if title != "" {
                        realmManager.addTaskList(title: title)
                        realmManager.getTaskLists()
                        userData.selectedTaskList = realmManager.taskLists.last

                        dismiss()
                    }
                }, label: {
                    Text("完成")
                }))
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "arrow.backward")
                        })
                    }
                }

            Divider()
            Spacer()
        }
        .onDisappear {
            self.enableAddTaskBtn = userData.selectedTaskList != nil
        }
    }
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView()
    }
}
