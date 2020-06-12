//
//  OrderView.swift
//  ProvaOrder
//
//  Created by Romesh Singhabahu on 12/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("€\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination:
                        CheckoutView()) {
                            Text("Procedi all'acquisto")
                    }
                }.disabled(order.items.isEmpty)
            }
            .navigationBarTitle("Ordine")
            .listStyle(GroupedListStyle())
        .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
