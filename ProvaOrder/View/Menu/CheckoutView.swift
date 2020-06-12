//
//  CheckoutView.swift
//  ProvaOrder
//
//  Created by Romesh Singhabahu on 12/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Contanti", "Carta di Credito"]
    static let tipAmounts = [10, 20, 30, 40, 0]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltynumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }

    
    var body: some View {
        Form {
            Section {
                Picker("Come vuoi pagare?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Aggiungi la tua carta IKEA Family")
                }
                
                if addLoyaltyDetails {
                    TextField("Inserisci il tuo numero ID", text: $loyaltynumber)
                }
            }
            
            Section(header: Text("Dona un 💰 all ospedale pediatrico di Padova")) {
                Picker("Percentuale", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Totale: €\(totalPrice, specifier: "%.2f")")
                .font(.title)
            ) {
                Button("Conferma ordine") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Pagamenti"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Ordine Confermato 😊"), message: Text("Il tuo totale ordine è: €\(totalPrice, specifier: "%.2f") - grazie! "), dismissButton: .default(Text("Ok")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
