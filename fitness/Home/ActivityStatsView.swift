//
//  ActivityStatsView.swift
//  fitness
//
//  Created by Dominik Rubröder on 04.05.22.
//

import SwiftUI

struct ActivityStatsView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8.0) {
                VStack(alignment: .leading) {
                    Text("Bewegen")
                    
                    HStack(spacing: 0.0) {
                        Text("83/640")
                        Text("kcal")
                            .textCase(.uppercase)
                    }
                    .foregroundColor(.red)
                }
                
                VStack(alignment: .leading) {
                    Text("Trainieren")
                    
                    HStack(spacing: 0.0) {
                        Text("2/45")
                        Text("min.")
                            .textCase(.uppercase)
                    }
                    .foregroundColor(.accentColor)
                }
                
                VStack(alignment: .leading) {
                    Text("Stehen")
                    
                    HStack(alignment: .bottom, spacing: 0.0) {
                        Text("4/12")
                            .fontWeight(.bold)
                        
                        Text("std")
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                    }
                    .foregroundColor(.teal)
                    
                }
            }
            
            Spacer()
            
            Circle()
                .frame(width: 125.0, height: 125.0)
                .foregroundColor(Color(.systemGray5))
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12.0)
    }
}

struct ActivityStatsView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityStatsView()
    }
}
