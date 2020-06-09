//
//  RowNovitàView.swift
//  IKEAfood
//
//  Created by Romesh Singhabahu on 06/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct RowNovita_View: View {
    
    var section: SectionNewItems
    
    var body: some View {
        
        VStack {
                section.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: 24)
                    .frame(width: 270, height: 100)
                    .clipped()
                    .overlay(ImageButtonView(), alignment: .topTrailing)
                
                VStack {
                    HStack {
                        Text(section.title)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Mozzarella, pomodoro, insalata, olive...")
                            .font(.caption)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Disponibile")
                            .foregroundColor(.white)
                            .font(.system(size: 9, weight: .bold, design: .rounded))
                            .padding(.vertical, 2)
                            .padding(.horizontal, 12)
                            .background(Color.green)
                            .cornerRadius(8)
                        
                        ForEach(0 ..< 5) { _ in
                            Image(systemName: "star.fill")
                                .font(.caption)
                                .foregroundColor(.yellow)
                        }
                        
                        Text("(227)")
                            .font(.caption)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text(section.price)
                            .font(.title)
                        Spacer()
                        
                        Button(action: {
                            //
                        }) {
                            Image(systemName: "cart")
                                .foregroundColor(.white)
                                .font(.system(size: 23, weight: .bold, design: .rounded))
                                .padding(.vertical, 9)
                                .padding(.horizontal, 12)
                                .background(Color("IkeaBlu"))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .frame(width: 270)
            .background(Color(.secondarySystemFill))
            .cornerRadius(8)
            .padding()
        }
}

struct RowNovita_View_Previews: PreviewProvider {
    static var previews: some View {
        RowNovita_View(section: SectionNewItems(title: "Nuovo Panino vegetariano", image: Image("hot_dog_ikea_1"), description: "Pomodoro, mozzoralla, insalata, origano", price: "23€"))
    }
}

struct ImageButtonView: View {
    @State private var isTapped = false
    
    var body: some View {
        Button(action: {
            self.isTapped.toggle()
        }) {
            Image(systemName: isTapped ? "heart.fill" : "heart")
                .foregroundColor(isTapped ? .red : .white)
                .padding()
        }
    }
}


// MARK: - DUMMY DATA

struct SectionNewItems : Identifiable{
    var id = UUID()
    var title: String
    var image: Image
    var description: String
    var price: String
}

let sectionNewData = [
    SectionNewItems(title: "Titolo", image: Image("hot_dog_ikea_1"), description: "Pomodoro, mozzoralla, insalata, origano", price: "23€")
]
