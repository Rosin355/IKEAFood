//
//  ContentView.swift
//  ProvaOrder
//
//  Created by Romesh Singhabahu on 08/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var FoodCategoryType = 0
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView{
//            VStack {
//                Picker("Options", selection: $FoodCategoryType) {
//                    Text("Bistrot").tag(0)
//                    Text("Ristorante").tag(1)
//                }.pickerStyle(SegmentedPickerStyle())
//            }.padding()
            
            VStack {
                List {
                    ForEach(menu) { section in
                        Section(header: Text(section.name)) {
                            ForEach(section.items) { item in
                                Text(item.name)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Menu", displayMode: .inline)
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
