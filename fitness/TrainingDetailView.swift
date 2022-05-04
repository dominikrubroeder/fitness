//
//  TrainingDetailView.swift
//  fitness
//
//  Created by Dominik Rubröder on 02.05.22.
//

import SwiftUI

struct TrainingDetailView: View {
    @State private var showEditView = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16.0) {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 70.0, height: 70.0)
                    }
                    .frame(width: 100.0, alignment: .leading)
                    
                    
                    VStack(alignment: .leading, spacing: 8.0) {
                        VStack(alignment: .leading) {
                            Text("Traditionelles Krafttraining")
                            Text("Offenes Ziel")
                                .font(.caption)
                                .foregroundColor(.accentColor)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("17:25 - 19:25")
                            HStack(spacing: 0.0) {
                                Image(systemName: "location.fill")
                                Text("Wolfratshausen")
                            }
                        }
                        .font(.caption)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Gesamtzeit")
                            .font(.caption)
                        Text("2:00:15")
                            .font(.title2)
                            .foregroundColor(.yellow)
                    }
                    .frame(width: 100.0, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text("Aktivitätskalorien")
                            .font(.caption)
                        HStack(spacing: 0.0) {
                            Text("796")
                            Text("kcal")
                        }
                        .font(.title2)
                        .foregroundColor(.red)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Gesamtkalorien")
                            .font(.caption)
                        
                        HStack(spacing: 0.0) {
                            Text("988")
                            Text("kcal")
                        }
                        .font(.title2)
                        .foregroundColor(.red)
                    }
                    .frame(width: 100.0, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text("ø-Herzfrequenz")
                            .font(.caption)
                        HStack(spacing: 0.0) {
                            Text("121")
                            Text("bpm")
                        }
                        .font(.title2)
                        .foregroundColor(.red)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Herzfrequenz")
                            .font(.caption)
                        
                        HStack(spacing: 0.0) {
                            Text("988")
                            Text("kcal")
                        }
                    }
                    
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4.0) {
                        Text("Karte")
                            .font(.caption)
                        Rectangle()
                            .frame(width: 75.0, height: 75.0)
                            .cornerRadius(8.0)
                    }
                    .frame(width: 100.0, alignment: .leading)
                    
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
            .navigationTitle("Do. 28. Apr.")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        showEditView = true
                    } label: {
                        // Image(systemName: "square.and.arrow.up")
                        Text("Bearbeiten")
                    }
                    .sheet(isPresented: $showEditView) {
                        TrainingDetailEditView()
                    }
                }
            }
        }
    }
}

struct TrainingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingDetailView()
            .preferredColorScheme(.dark)
    }
}
