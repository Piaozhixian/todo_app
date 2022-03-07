//
//  ListNameTab.swift
//  TodoApp
//
//  Created by Zhixian Piao on 2022/03/04.
//

import SwiftUI

struct ListNameTab: View {
    var name: String
    var selected: Bool = false
    var body: some View {
        VStack {
            Text(name)
                .frame(minWidth: 50)
            
            let color = selected ? Color.blue : Color.clear
            RoundedRectangle(cornerRadius: 30)
                .fill(color)
                .frame(maxWidth: .infinity, maxHeight: 3)
        }
        
    }
}

struct ListNameTab_Previews: PreviewProvider {
    static var previews: some View {
        ListNameTab(name: "My tasks", selected: true)
    }
}
