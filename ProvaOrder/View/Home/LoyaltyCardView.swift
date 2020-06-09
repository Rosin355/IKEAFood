//
//  LoyaltyCardView.swift
//  IKEAfood
//
//  Created by Romesh Singhabahu on 06/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct LoyaltyCardView: View {
    var body: some View {
        VStack {
            Image("Ikea_family_taak")
            .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack {
                    Text("Scopri tutti i vantaggi")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .padding()
                        
                    
                    Text("IKEA Family è per tutti coloro che amano la loro casa e hanno un debole per l'arredamento. Non importa in che periodo della tua vita ti trovi, chiunque è il benvenuto da IKEA Family...")
                        .font(.system(.subheadline))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                }
                Spacer()
            }
        }
        
        .padding()
        .padding(.bottom, 12)
    }
}

struct LoyaltyCardView_Previews: PreviewProvider {
    static var previews: some View {
        LoyaltyCardView()
    }
}
