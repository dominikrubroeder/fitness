//
//  HomeView.swift
//  fitness
//
//  Created by Dominik Rubröder on 02.05.22.
//

import SwiftUI

struct ActivityCard: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8.0) {
                VStack(alignment: .leading) {
                    Text("Bewegen")
                        .font(.caption)
                    
                    HStack(spacing: 0.0) {
                        Text("83/640")
                        Text("kcal")
                            .textCase(.uppercase)
                    }
                    .foregroundColor(.red)
                }
                
                VStack(alignment: .leading) {
                    Text("Trainieren")
                        .font(.caption)
                    
                    HStack(spacing: 0.0) {
                        Text("2/45")
                        Text("min.")
                            .textCase(.uppercase)
                    }
                    .foregroundColor(.accentColor)
                }
                
                VStack(alignment: .leading) {
                    Text("Stehen")
                        .font(.caption)
                    
                    HStack(alignment: .bottom, spacing: 0.0) {
                        Text("4/12")
                            .fontWeight(.bold)
                        Text("std")
                            .font(.caption)
                            .fontWeight(.bold)
                            .textCase(.uppercase)
                    }
                    .foregroundColor(.teal)
                    
                }
            }
            
            Spacer()
            
            Circle()
                .frame(width: 125.0, height: 125.0)
        }
        .padding(.vertical, 8.0)
    }
}

struct SectionHeader: View {
    var title: String
    var link: String = "Mehr anzeigen"
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .textCase(.none)
                .foregroundColor(.white)
                
            Spacer()
            Text(link)
                .font(.caption)
                .textCase(.none)
                .foregroundColor(.accentColor)
        }
    }
}

struct TrainingRow: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 35.0, height: 35.0)
            
            VStack(alignment: .leading) {
                Text("Traditionelles Krafttraining")
                    .font(.caption)
                
                HStack {
                    HStack(spacing: 0) {
                        Text("795")
                        Text("kcal")
                            .textCase(.uppercase)
                    }
                    .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    HStack(spacing: 0.0) {
                        Text("Donnerstag")
                        Image(systemName: "chevron.right")
                        
                    }
                    .font(.caption2)
                    .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 8.0)
    }
}

struct MindfullnessRow: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 35.0, height: 35.0)
            
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
                    .font(.caption2)
                    .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 8.0)
        }
    }
}

struct TrendColumn: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 25.0, height: 25.0)
            
            VStack(alignment: .leading) {
                Text("Bewegen")
                    .font(.caption)
                
                HStack(spacing: 0.0) {
                    Text("567")
                    Text("kcal/tag")
                        .textCase(.uppercase)
                }
                .foregroundColor(.red)
            }
        }
    }
}

struct HomeView: View {
    let trendColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: SectionHeader(title: "Aktivität")) {
                    ActivityCard()
                }
                
                Section(header: SectionHeader(title: "Trainings")) {
                    // No Navigation Link but presentSheet
                    ForEach(0..<3) {_ in
                        NavigationLink(destination: TrainingDetailView()) {
                            TrainingRow()
                        }
                    }
                }
                
                Section(header: SectionHeader(title: "Achtsamkeit")) {
                    MindfullnessRow()
                }
                
                Section(header: SectionHeader(title: "Trends")) {
                    TrendColumn()
                }
            }
            .navigationTitle("Übersicht")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
