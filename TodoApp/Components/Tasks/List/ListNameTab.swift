//
//  ListNameTab.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/04.
//

import SwiftUI

struct ListNameTab: View {
    var name: String
    var body: some View {
        Text(name)
            .frame(minWidth: 50)
    }
}

struct ListNameTab_Previews: PreviewProvider {
    static var previews: some View {
        ListNameTab(name: "My tasks")
    }
}
