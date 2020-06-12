//
//  Home.swift
//  IKEAfood
//
//  Created by Romesh Singhabahu on 02/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State private var isAddShowing = true
    let trendingFoods = sectionDataHeader
   
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    
                    // MARK: - HEADER
                    HeaderView()
                    
                    // MARK: - POPULAR
                    HStack {
                        Text("Categorie")
                        .foregroundColor(Color("IkeaBlu"))
                            .fontWeight(.heavy)
                        Spacer()
                    }.padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            RowTrendingView(section: SectionHeader(title: "Carne", image: Image("Category_beverages_4")))
                            
                            RowTrendingView(section: SectionHeader(title: "Carne e pesce", image: Image("Category_beverages_3")))
                            
                            RowTrendingView(section: SectionHeader(title: "Dolci e cioccolato", image: Image("Category_beverages_2")))
                            
                            RowTrendingView(section: SectionHeader(title: "Snaks", image: Image("Category_beverages_5")))
                        }
                    }
                    
                    // MARK: - BISTROT LIST FOOD
                    HStack {
                        Text("Novità dal Bistrot")
                            .foregroundColor(Color("IkeaBlu"))
                            .fontWeight(.heavy)
                        Spacer()
                    }.padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            RowNovita_View(section: SectionNewItems(title: "Nuovo Panino vegetariano", image: Image("hot_dog_ikea_1"), description: "Pomodoro, mozzoralla, insalata, origano", price: "5€"))
                            
                            RowNovita_View(section: SectionNewItems(title: "Gelato alla fragola", image: Image("gelato-vegano-alla-fragola"), description: "Latte, fragole fresce, panna", price: "2€"))
                            
                            RowNovita_View(section: SectionNewItems(title: "Tonno grigliato aromatizzato", image: Image("tonno-grigliato-ikea"), description: "Pomodoro, mozzoralla, insalata, origano", price: "23€"))
                        }
                    }
                    
                    Divider()
                    
                    // MARK: - BOTTOM CARD LOYALITY
                    VStack {
                        LoyaltyCardView()
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
            .padding(0)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

