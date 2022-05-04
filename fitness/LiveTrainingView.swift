//
//  LiveTrainingView.swift
//  fitness
//
//  Created by Dominik Rubröder on 02.05.22.
//

import SwiftUI

struct baseHeader: View {
    var body: some View {
        Text("Traditionelles Krafttraining")
            .foregroundColor(.accentColor)
    }
}

struct Exercise: Identifiable {
    let id = UUID()
    let sets: Int
    let repetitions: Int
    let title: String
}

// Exercise add form?
struct ExerciseView: View {
    @State var sets = ""
    @State var repetitions = ""
    @State var title = ""
    // Adding notes, further descriptions...
    // Add navigation link
    // Add muscle group (Back, Chest, Legs, ...)
    // Add hint: "Increase weight next time"
    
    var body: some View {
        HStack {
            TextField("Satzanzahl", text: $sets)
                .keyboardType(.numberPad)
                .frame(width: 50.0)
            
            TextField("Wiederholungen", text: $repetitions)
                .keyboardType(.numberPad)
                .frame(width: 50.0)
            
            TextField("Title", text: $title)
        }
    }
}

struct LiveTrainingView: View {
    @State var title: String = ""
    // @State var exercices: [ExerciseView] = []
    @State var exercicesCount = 0
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Live stats")) {
                    // Show live stats (calorie activity, current training time, ...)
                }
                
                // Add todays date
                
                Section(header: baseHeader()) {
                    TextField("Training title (\"Oberkörper\", \"Push\", \"Pull\")", text: $title)
                    Text("Title")
                }
                
                if (self.exercicesCount > 0) {
                    Section(header: Text("Exercises")) {
                        ForEach(0..<self.exercicesCount) {_ in
                            ExerciseView()
                        }
                    }
                }
                
                // Section per muscle group (Back, Chest, ...)
            }
            .navigationTitle("Live training")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        self.exercicesCount += 1
                    } label: {
                        Image(systemName: "plus.circle.fill")
                        Text("Übung hinzufügen")
                    }
                }
            }
        }
    }
}

struct LiveTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTrainingView()
            .preferredColorScheme(.dark)
    }
}
