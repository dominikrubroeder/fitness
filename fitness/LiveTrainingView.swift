//
//  LiveTrainingView.swift
//  fitness
//
//  Created by Dominik Rubröder on 02.05.22.
//

import SwiftUI

struct BaseHeader: View {
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

struct LiveStatView: View {
    let title: String
    let value: String
    let unit: String?
    var color: Color = Color.white
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
            
            HStack(alignment: .bottom, spacing: 0.0) {
                Text(value)
                    .font(.largeTitle)
                    .foregroundColor(color)
                
                if (unit != "") {
                    Text(unit ?? "")
                        .padding(.bottom, 4.0)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
}

struct LiveTrainingView: View {
    // title or "category"?
    @State var title: String = ""
    // @State var exercices: [ExerciseView] = []
    @State var exercicesCount = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                BaseHeader()
                
                VStack {
                    Section {
                        VStack(spacing: 16.0) {
                            HStack {
                                HStack {
                                    HStack(spacing: 0.0) {
                                        Image(systemName: "location.fill")
                                        Text("Wolfratshausen")
                                    }
                                    
                                    Text("Offenes Ziel")
                                        .font(.caption)
                                    
                                    HStack {
                                        Text("17:25 - ...")
                                    }
                                    .font(.caption)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            VStack(alignment: .leading, spacing: 4.0) {
                                LiveStatView(title: "Gesamtzeit", value: "0:34:29,92", unit: "", color: Color.yellow)
                                
                                LiveStatView(title: "Aktivitätskalorien", value: "796", unit: "kcal")
                                
                                LiveStatView(title: "Gesamtkalorien", value: "988", unit: "kcal")
                                
                                LiveStatView(title: "ø-Herzfrequenz", value: "121", unit: "bpm")
                            }
                            
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 8.0) {
                                    Text("Wetter")
                                        .font(.caption)
                                    
                                    HStack(spacing: 8.0) {
                                        Image(systemName: "sun.max.fill").foregroundColor(.yellow)
                                        HStack(spacing: 0.0) {
                                            Text("17")
                                            Text("Grad")
                                        }
                                        .font(.title2)
                                    }
                                    
                                    HStack(spacing: 4.0) {
                                        Text("Feuchtigkeit:")
                                        Text("32%")
                                    }
                                    .font(.caption)
                                }
                                
                                Spacer()
                            }
                            
                        }
                    }
                    .listRowBackground(Color.clear)
                    
                    // Add todays date
                    
                    Section {
                        TextField("Training title (\"Oberkörper\", \"Push\", \"Pull\")", text: $title)
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
                .padding()
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Spacer()
                        
                        Button {
                            self.exercicesCount += 1
                        } label: {
                            Image(systemName: "plus.circle.fill")
                            Text("Übung hinzufügen")
                        }
                        
                        Spacer()
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
