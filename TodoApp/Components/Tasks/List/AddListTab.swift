//
//  AddListTab.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/04.
//

import SwiftUI

struct AddListTab: View {
    var body: some View {
        NavigationLink(destination: AddListView()) {
            Text("+ Add List")
        }
        
    }
}

struct AddListTab_Previews: PreviewProvider {
    static var previews: some View {
        AddListTab()
    }
}
