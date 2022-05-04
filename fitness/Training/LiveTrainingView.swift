//
//  LiveTrainingView.swift
//  fitness
//
//  Created by Dominik Rubröder on 02.05.22.
//

import SwiftUI

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
    @State private var animate: Bool = false
    
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
                    .font(.title)
                    .foregroundColor(color)
                
                if (unit != "") {
                    Text(unit ?? "")
                        .padding(.bottom, 4.0)
                }
                
                Spacer()
            }
        }
        .padding()
        .background(animate ? Color(.systemGray6) : Color.clear)
        .cornerRadius(16)
        .frame(maxWidth: .infinity)
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

struct LiveTrainingView: View {
    // title or "category"?
    @State var title: String = ""
    // @State var exercices: [ExerciseView] = []
    @State var exercicesCount = 0
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Traditionelles Krafttraining")
                    .foregroundColor(.accentColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Section {
                        VStack(spacing: 16.0) {
                            LazyVGrid(columns: columns, spacing: 8.0) {
                                LiveStatView(title: "Gesamtzeit", value: "0:34:29,92", unit: "", color: Color.yellow)
                                
                                LiveStatView(title: "Aktivitätskalorien", value: "796", unit: "kcal")
                                
                                LiveStatView(title: "Gesamtkalorien", value: "988", unit: "kcal")
                                
                                LiveStatView(title: "ø-Herzfrequenz", value: "121", unit: "bpm")
                            }
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    HStack(spacing: 4.0) {
                                        Image(systemName: "location.fill")
                                            .resizable(resizingMode: .stretch)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 8.0, height: 8.0)
                                        Text("Wolfratshausen")
                                    }
                                    
                                    HStack(spacing: 4.0) {
                                        Image(systemName: "sun.max.fill").foregroundColor(.yellow)
                                        
                                        HStack(spacing: 0) {
                                            Text("17")
                                            Text("°")
                                        }
                                    }
                                    
                                    Text("Offenes Ziel")
                                }
                                .font(.caption)
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
            .padding()
            .background(Color.black)
        }
    }
}

struct LiveTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTrainingView()
            .preferredColorScheme(.dark)
    }
}
