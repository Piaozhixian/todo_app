//
//  ListBar.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/04.
//

import SwiftUI

struct ListBar: View {
    var body: some View {
        HStack {
            ListNameTab(name: "My tasks")
            Spacer()
            AddListTab()
        }
    }
}

struct ListBar_Previews: PreviewProvider {
    static var previews: some View {
        ListBar()
    }
}
