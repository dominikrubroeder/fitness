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
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading) {
                    Text("Bewegen")
                    HStack(spacing: 0.0) {
                        Text("83/640")
                        Text("kcal")
                    }
                }
                VStack(alignment: .leading) {
                    Text("Trainieren")
                    HStack(spacing: 0.0) {
                        Text("2/45")
                        Text("min.")
                    }
                }
                VStack(alignment: .leading) {
                    Text("Stehen")
                    HStack(spacing: 0.0) {
                        Text("4/12")
                        Text("std")
                    }
                }
            }
            
            Circle()
        }
    }
}

struct SectionHeader: View {
    var body: some View {
        HStack {
            Text("Aktivität")
                .font(.headline)
                .fontWeight(.bold)
                .textCase(.none)
                .foregroundColor(.black)
                
            Spacer()
            Text("Mehr anzeigen")
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
                HStack(spacing: 0) {
                    Text("795")
                    Text("kcal")
                }
            }
            HStack {
                Spacer()
                Text("Donnerstag").font(.footnote)
            }
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: SectionHeader()) {
                    ActivityCard()
                }
                
                Section(header: SectionHeader()) {
                    ForEach(0..<3) {_ in
                        NavigationLink(destination: TrainingDetailView()) {
                            TrainingRow()
                        }
                    }
                }
            }
            .navigationTitle("Übersicht")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
