//
//  SelectCurrencyView.swift
//  LOTR_Converter
//
//  Created by CIPL on 06/10/25.
//

import SwiftUI

struct SelectCurrencyView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
    var body: some View {
        // Main holder
        ZStack {
            // Background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            // Content holder
            VStack {
                // Title
                Text("Select the Currency your startin with:")
                    .fontWeight(.bold)
                
                // Top Currency Grid View
                IconGrid(currency: $topCurrency)

                // Title
                Text("Select the Currency your would like to convert to:")
                    .fontWeight(.bold)
                
                // Bottom Currency Grid View
                IconGrid(currency: $bottomCurrency)
                
                // Done button
                Button("Done"){
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .foregroundStyle(.white)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    
            }
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .copperPenny
    @Previewable @State var bottomCurrency: Currency = .goldPiece
    SelectCurrencyView(
        topCurrency: $topCurrency,
        bottomCurrency: $bottomCurrency
    )
}
