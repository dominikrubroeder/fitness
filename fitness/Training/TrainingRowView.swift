//
//  TrainingRow.swift
//  fitness
//
//  Created by Dominik Rubröder on 04.05.22.
//

import SwiftUI

struct TrainingRowView: View {
    var training: Training
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 35.0, height: 35.0)
                .foregroundColor(Color(.systemGray5))
            
            VStack(alignment: .leading) {
                Text(training.type)
                
                HStack {
                    HStack(alignment: .bottom, spacing: 0) {
                        Text("\(training.caloriesActivity)")
                            .font(.title)
                        Text("kcal")
                            .textCase(.uppercase)
                            .padding(.bottom, 4.0)
                    }
                    .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 0.0) {
                        Text("Donnerstag")
                        Image(systemName: "chevron.right")
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(Color(.systemGray6))
        .cornerRadius(12.0)
    }
}

struct TrainingRow_Previews: PreviewProvider {
    static var previews: some View {
        TrainingRowView(training: trainings[0])
    }
}
