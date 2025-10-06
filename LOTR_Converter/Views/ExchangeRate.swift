//
//  ExchangeRate.swift
//  LOTR_Converter
//
//  Created by CIPL on 06/10/25.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let rightImage: ImageResource
    let text: String
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(text)
                .font(.caption)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(
        leftImage: .goldpiece,
        rightImage: .goldpenny,
        text: "1 Gold Piece = 4 Gold Pennies"
    )
}
