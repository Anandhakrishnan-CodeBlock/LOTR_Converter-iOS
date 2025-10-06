//
//  IconGrid.swift
//  LOTR_Converter
//
//  Created by CIPL on 06/10/25.
//

import SwiftUI

struct IconGrid: View {
    
    @Binding var currency: Currency

    var body: some View {
        // Grid view
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if (self.currency == currency){
                    // Icon Card
                    CurrencyIcon(icon: currency.image, name: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                           RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                }else{
                    // Icon Card
                    CurrencyIcon(icon: currency.image, name: currency.name)
                        .onTapGesture {
                        self.currency = currency
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currency: Currency = .copperPenny
    IconGrid(currency: $currency)
}
