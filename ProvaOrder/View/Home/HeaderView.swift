//
//  HeaderView.swift
//  IKEAfood
//
//  Created by Romesh Singhabahu on 06/06/2020.
//  Copyright © 2020 Romesh Singhabahu. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Image("piatto-regionale-giugno")
            .resizable()
            .scaledToFit()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.sizeThatFits)
    }
}
