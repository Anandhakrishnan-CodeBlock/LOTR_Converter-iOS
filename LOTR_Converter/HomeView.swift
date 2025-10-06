//
//  ContentView.swift
//  LOTR_Converter
//
//  Created by CIPL on 06/10/25.
//

import SwiftUI
import TipKit

struct HomeView: View {
    
    @State var showExchangeInfo : Bool = false
    @State var showSelectCurrency : Bool = false
    
    @State var leftAmount : String = ""
    @State var rightAmount : String = ""
    
    @FocusState var leftTypingFocus: Bool
    @FocusState var rightTypingFocus: Bool
    @FocusState var keyboardAction: Bool
    
    @State var leftCurrency: Currency = .copperPenny
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack{
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            // Main layout holder
            VStack{
                // Icon image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                // Title text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                // Currency section
                HStack{
                    // Left conversion section
                    VStack(alignment: HorizontalAlignment.leading){
                        // Currency
                        HStack{
                            // Currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }.onTapGesture {
                            showSelectCurrency.toggle()
                            // close tip message
                            //currencyTip.invalidate(reason: .actionPerformed)
                        }.popoverTip(currencyTip, arrowEdge: .bottom)
                        // Text field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTypingFocus)
                            .focused($keyboardAction)
                    }
                    // Equal icon
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                 
                    // Right conversion section
                    VStack(alignment: HorizontalAlignment.trailing){
                        // Currency
                        HStack{
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                                
                            // Currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                           
                        }.onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        // Text field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTypingFocus)
                            .focused($keyboardAction)
                    }
                }.padding()
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)
                    .keyboardType(.decimalPad)
                    .submitLabel(.done)
                Spacer()
                // Button holder
                HStack {
                    Spacer()
                    // Info button
                    Button{
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }.padding(.trailing)
                }
               
            }
        }.task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount){
            if(leftTypingFocus){
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }.onChange(of: rightAmount){
            if(rightTypingFocus){
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }.onChange(of: leftCurrency){
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }.onChange(of: rightCurrency){
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }.sheet(isPresented: $showExchangeInfo){
            ExchangeInfoView()
        }.sheet(isPresented: $showSelectCurrency){
            SelectCurrencyView(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }.toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    keyboardAction = false
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
