//
//  ItemDetail.swift
//  ProvaOrder
//
//  Created by Romesh Singhabahu on 09/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    
    @EnvironmentObject var order: Order
    
    @State private var showingAlert = false
    
    var item: MenuItem
    
    private func getScrollOffest(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        
        let offset = getScrollOffest(geometry)
        
        // image was pulled down
        if offset > 0 {
            return -offset
        }
        
        return 0
    }
    
    private func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        
        let offset = getScrollOffest(geometry)
        let imageHeight = geometry.size.height
        
        if offset > 0 {
            return imageHeight + offset
        }
        return imageHeight
        
    }
    
    var body: some View {
        
        ScrollView {
            GeometryReader { geometry in
                Image(self.item.mainImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: self.getHeightForHeaderImage(geometry))
                    .clipped()
                    .offset(x: 0, y: self.getOffsetForHeaderImage(geometry))
            }.frame(height: 300)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    
                    // 1. THUMBNAIL IMAGE PROFILE
                    Image(item.mainImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                    
                    // 2. DETAILS OF MANAGERS
                    VStack(alignment: .leading) {
                        Text("Bistrot manager")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        Text(item.photoCredit)
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                    }
                }
                // 3. WAITING HOURS
                Text("Tempi di attesa: 3min")
                    .foregroundColor(.gray)
                
                // 4. TITLE ITEM
                Text(item.name)
                    .font(.title)
                    .fontWeight(.heavy)
                
                // 5. DESCRIPTION ITEM
                Text(item.description)
                    .lineLimit(nil)
                    .font(.system(size: 17))
                    .padding(.bottom)
                
                 // 6. BUY NOW BUTTON
                Button(action: {
                    self.order.add(item: self.item)
                    self.showingAlert = true
                }) {
                    HStack {
                        Text("Compra ora")
                    }
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding(1.0)
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                .padding()
                .background(Color("IkeaBlu"))
                .cornerRadius(8)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("🎉 \(item.name) aggiunto corretamente"))
                               }
              
            }
            .padding(.horizontal)
            .padding(.top, 16.0)
        }.edgesIgnoringSafeArea(.all)
        
        
        
    }
    
}

struct ItemDetail_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        NavigationView{
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
