//
//  LiveTrainingRowView.swift
//  fitness
//
//  Created by Dominik Rubröder on 04.05.22.
//

import SwiftUI

struct LiveTrainingRowView: View {
    @State private var animate: Bool = false
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 35.0, height: 35.0)
            
            VStack(alignment: .leading) {
                Text("Traditionelles Krafttraining")
                
                Text("Live Training")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .padding()
        .foregroundColor(.white)
        .background(animate ? Color.accentColor : Color.accentColor.opacity(0.87))
        .cornerRadius(12.0)
        .onAppear {
            self.animate.toggle()
        }
        .animation(
            .easeInOut(duration: 1)
                .repeatForever(autoreverses: true),
            value: animate
        )
    }
}

struct LiveTrainingRowView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTrainingRowView()
    }
}
