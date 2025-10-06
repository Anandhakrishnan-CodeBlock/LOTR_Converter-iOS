//
//  CarrencyTip.swift
//  LOTR_Converter
//
//  Created by CIPL on 06/10/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title: Text = Text("Change Currency")
    var message: Text? = Text("You can tap left or right currency to bring up the Selection Currency Screen.")
    var image: Image? = Image(systemName: "hand.tap.fill")
}
