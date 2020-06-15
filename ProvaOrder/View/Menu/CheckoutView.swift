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
    static let timePicker = ["9:00", "9:15", "9:30", "9:45", "10:00", "10:15", "10:15", "10:30", "10:45", "11:00", "11:15","11:30", "11:45", "12:00", "12:15","12:30", "12:45", "13:00", "13:15","13:30", "13:45", "14:00", "14:15","14:30", "14:45", "15:00", "15:15","15:30", "15:45", "16:00", "16:15","16:30", "16:45", "17:00", "17:15","17:30", "17:45", "18:00", "18:15","18:30", "18:45", "19:00", "19:15","19:30", "19:45",  "20:00", "20:15","20:30"]
    static let tipAmounts = [10, 20, 30, 40, 0]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltynumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    @State private var timePick = 0
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }

    
    var body: some View {
        Form {
            
            // 1. ORDER TIME AND QUANTITY
            
            Section(header: Text("Inserisci quantitò prodotto e a che ora vuoi ritirare il tuo cibo")){
                
                Stepper(value: $order.quantity, in: 3...20) {
                    Text("Quantità: \(order.quantity)")
                }
                Picker("A che ora arrivi?", selection: $timePick) {
                    ForEach(0 ..< Self.timePicker.count, id: \.self) {
                        Text(Self.timePicker[$0])
                    }
                }
            }
            
            // 2. ORDER PAYMEMNT METHODS
            
            Section {
                Picker("Come vuoi pagare?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count, id: \.self) {
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
            
            // 3. DONATION BUTTONS
            
            Section(header: Text("Dona un 💰 all ospedale pediatrico di Padova")) {
                Picker("Percentuale", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            // 4. DELIVERY DETAILS
            
            Section(header: Text("Inserisci i tuoi dati"),
                    footer: Text("Leggi la nostra privacy policy")) {
                        NavigationLink(destination: AddressView(order: _order)){
                            Text("Contatti form")
                        }
            }
            
            // 5. TOTAL LABEL AND CONFERM BUTTON
            
            Section(header: Text("Totale: €\(totalPrice, specifier: "%.2f")")
                .font(.title)
            ) {
                Button("Conferma ordine") {
                    self.showingPaymentAlert.toggle()
                }
            }.disabled(order.hasValidAddress == false)
        }
        .navigationBarTitle(Text("Pagamenti"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Ordine Confermato 😊"), message: Text("Il tuo totale ordine è: €\(totalPrice, specifier: "%.2f") - ⚠️ attendi che un nostro operatore ti dia la conferma via notifica o mail! "), dismissButton: .default(Text("Ok, ho capito!")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
