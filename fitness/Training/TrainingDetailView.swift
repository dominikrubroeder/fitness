//
//  TrainingDetailView.swift
//  fitness
//
//  Created by Dominik Rubröder on 02.05.22.
//

import SwiftUI

struct TrainingDetailView: View {
    let training: Training
    @State private var showEditView = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16.0) {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 75.0, height: 75.0)
                            .foregroundColor(.accentColor)
                        
                        Image(systemName: "\(training.icon)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    .frame(width: 125.0, alignment: .leading)
                    
                    
                    VStack(alignment: .leading, spacing: 8.0) {
                        VStack(alignment: .leading) {
                            Text(training.type)
                            Text("Offenes Ziel")
                                .foregroundColor(.accentColor)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(training.timeSpan)
                            HStack(spacing: 0.0) {
                                Image(systemName: "location.fill")
                                Text(training.location)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Gesamtzeit")
                        Text(training.timeTotal)
                            .font(.title)
                            .foregroundColor(.yellow)
                    }
                    .frame(width: 125.0, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text("Aktivitätskalorien")

                        HStack(spacing: 0.0) {
                            Text("\(training.caloriesActivity)")
                            Text("kcal")
                        }
                        .font(.title)
                        .foregroundColor(.red)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Gesamtkalorien")
                        
                        HStack(spacing: 0.0) {
                            Text("\(training.caloriesTotal)")
                            Text("kcal")
                        }
                        .font(.title)
                        .foregroundColor(.red)
                    }
                    .frame(width: 125.0, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text("ø-Herzfrequenz")

                        HStack(spacing: 0.0) {
                            Text("\(training.heartRateAverage)")
                            Text("bpm")
                        }
                        .font(.title)
                        .foregroundColor(.red)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Herzfrequenz")
                        
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 150.0)
                            .foregroundColor(Color(.systemGray6))
                            .cornerRadius(16.0)
                    }
                    
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4.0) {
                        Text("Karte")
                        
                        Rectangle()
                            .frame(width: 75.0, height: 75.0)
                            .foregroundColor(Color(.systemGray6))
                            .cornerRadius(12.0)
                    }
                    .frame(width: 125.0, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Wetter")
                        
                        HStack(spacing: 8.0) {
                            Image(systemName: "\(training.weatherImage)").foregroundColor(.yellow)
                            HStack(spacing: 0.0) {
                                Text("\(training.weatherCelcius)")
                                Text("Grad")
                            }
                            .font(.title2)
                        }
                        
                        HStack(spacing: 4.0) {
                            Text("Feuchtigkeit:")
                            Text("\(training.weatherMoisture)")
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Do. 28. Apr.")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showEditView = true
                    } label: {
                        Text("Bearbeiten")
                    }
                    .sheet(isPresented: $showEditView) {
                        TrainingDetailEditView(training: training)
                    }
                }
            }
        }
    }
}

struct TrainingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingDetailView(training: trainings[0])
            .preferredColorScheme(.dark)
    }
}
