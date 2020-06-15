//
//  AddressView.swift
//  ProvaOrder
//
//  Created by Romesh Singhabahu on 12/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Nome", text: $order.name)
                TextField("Indirizzo", text: $order.streetAddress)
                TextField("Città",text: $order.city)
                TextField("Cap", text: $order.zip)
                TextField("Telefono", text: $order.telephone)
            }
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    
    static let order = Order()
    static var previews: some View {
        AddressView().environmentObject(order)
    }
}
