//
//  MindfullnessRowView.swift
//  fitness
//
//  Created by Dominik Rubröder on 04.05.22.
//

import SwiftUI

struct MindfullnessRowView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 35.0, height: 35.0)
                .foregroundColor(Color(.systemGray5))
            
            VStack(alignment: .leading) {
                Text("Atmen")
                    .font(.caption)
                
                HStack {
                    HStack(spacing: 4.0) {
                        Text("1")
                        Text("min.")
                    }
                    .foregroundColor(.teal)
                    
                    Spacer()
                    
                    HStack(spacing: 0.0) {
                        Text("29.03.22")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 8.0)
        }
    }
}

struct MindfullnessRowView_Previews: PreviewProvider {
    static var previews: some View {
        MindfullnessRowView()
    }
}
