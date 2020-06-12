//
//  ItemRow.swift
//  ProvaOrder
//
//  Created by Romesh Singhabahu on 08/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    static let colors: [String: Color] = ["D": .purple, "G": .orange, "N": .red, "S": .yellow, "V": .pink]
    var item: MenuItem
    
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("IkeaBlu"), lineWidth: 2))
                VStack(alignment: .leading){
                    Text(item.name)
                        .font(.headline)
                    Text("€ \(item.price)")
                }.layoutPriority(1)
                
                Spacer()
                
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(5)
                        .background(Self.colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
