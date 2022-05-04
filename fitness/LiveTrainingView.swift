//
//  LiveTrainingView.swift
//  fitness
//
//  Created by Dominik Rubröder on 02.05.22.
//

import SwiftUI

struct LiveTrainingView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Live training view")
                .font(.title)
            Text("This view is for while an active training is running on the Apple Watch to see current training stats like on Apple Watch, add exercises, set timers, ...")
        }
        .padding()
    }
}

struct LiveTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTrainingView()
    }
}
