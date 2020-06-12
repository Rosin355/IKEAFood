//
//  TabBar.swift
//  IKEAfood
//
//  Created by Romesh Singhabahu on 02/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct TabBar: View {
        
    @State private var selection = 2
    
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "house").font(.system(size: 16, weight: .bold, design: .rounded))
                Text("Home")
            }.tag(0)
            ContentView().tabItem {
                Image(systemName: "bag").font(.system(size: 16, weight: .bold, design: .rounded))
                Text("Menu")
                
            }.tag(1)
            ContentView().tabItem {
                Image(systemName: "bell").font(.system(size: 16, weight: .bold, design: .rounded))
                Text("Notifiche")
            }.tag(2)
            ContentView().tabItem {
                Image(systemName: "person").font(.system(size: 16, weight: .bold, design: .rounded))
                Text("Impostazioni")
            }.tag(3)
        }
//        .onAppear {
        //If you comment the translucent property it get rid of the gray rectangle
//           // UITabBar.appearance().isTranslucent = false
//            UITabBar.appearance().barTintColor = UIColor(named: "IkeaBlu")
//        }.accentColor(Color(.white))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
