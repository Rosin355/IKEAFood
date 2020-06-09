//
//  RowTrendingView.swift
//  IKEAfood
//
//  Created by Romesh Singhabahu on 06/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct RowTrendingView: View {
     
       var section: SectionHeader
       
       var body: some View {
           VStack(alignment: .leading) {
               
               section.image
                   .resizable()
                   .clipped()
                   .cornerRadius(6)
            
               Text(section.title)
                   .multilineTextAlignment(.leading)
                   .lineLimit(nil)
                   .padding(.leading, 0)
                   .font(.caption)
           }.frame(width: 110, height: 140)
            .padding()
    }
}

struct RowTrendingView_Previews: PreviewProvider {
    static var previews: some View {
        RowTrendingView(section: SectionHeader(title: "Hot dog vegetariano", image: Image("Category_beverages_1")))
    }
}


struct SectionHeader: Identifiable {
    var id = UUID()
    var title: String
    var image: Image
}

let sectionDataHeader = [
    SectionHeader(title: "Menu sfizioso buono da mangiare", image: Image("hot-dog-vegetariano")),
    SectionHeader(title: "Menu bimbi a prezzo scontanto", image: Image("pizza-tonda"))
]
