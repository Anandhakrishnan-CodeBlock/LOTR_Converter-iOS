//
//  SelectIconView.swift
//  LOTR_Converter
//
//  Created by CIPL on 06/10/25.
//

import SwiftUI

struct CurrencyIcon: View {
    let icon: ImageResource
    let name: String
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Icon
            Image(icon)
                .resizable()
                .scaledToFit()
            // Name
            Text(name)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyIcon(icon: .copperpenny, name: "Copper Penny")
}
