//
//  BuyButtonStyle.swift
//  ITunesSearchApp
//
//  Created by Volkan Celik on 18/07/2023.
//

import SwiftUI

struct BuyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.accentColor)
            .padding(5)
            .padding(.horizontal,10)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.accentColor,lineWidth: 1))
            .opacity(configuration.isPressed ? 0.5 : 1)
        
    }
}

struct BuyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Button("1.99 USD") {
                
            }
            .buttonStyle(BuyButtonStyle())
        }
    }
}
