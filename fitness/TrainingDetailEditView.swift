//
//  TrainingDetailEditView.swift
//  fitness
//
//  Created by Dominik Rubröder on 02.05.22.
//

import SwiftUI

struct TrainingDetailEditView: View {
    @Environment(\.presentationMode) var presentationMode
    let training: Training
    
    @State private var notes: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextEditor(text: $notes)
                        .background(Color(.systemGray6))
                }
            }
            .navigationTitle("Edit view")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Abbrechen")
            }, trailing: Button {
                // Save changes
                // ...
                
                // Dismiss view
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Fertig")
            })
        }
    }
}

struct TrainingDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingDetailEditView(training: trainings[0])
            .preferredColorScheme(.dark)
    }
}
