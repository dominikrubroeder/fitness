//
//  TrendView.swift
//  fitness
//
//  Created by Dominik Rubröder on 04.05.22.
//

import SwiftUI

struct TrendView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 25.0, height: 25.0)
            
            VStack(alignment: .leading) {
                Text("Bewegen")
                
                HStack(spacing: 0.0) {
                    Text("567")
                    Text("kcal/tag")
                        .textCase(.uppercase)
                }
                .foregroundColor(.red)
            }
        }
    }
}

struct TrendView_Previews: PreviewProvider {
    static var previews: some View {
        TrendView()
    }
}
