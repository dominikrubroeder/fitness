//
//  HomeView.swift
//  fitness
//
//  Created by Dominik Rubröder on 02.05.22.
//

import SwiftUI

struct SectionHeader: View {
    var title: String
    var link: String = "Mehr anzeigen"
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .textCase(.none)
                .foregroundColor(.white)
                
            Spacer()
            
            Text(link)
                .textCase(.none)
                .foregroundColor(.accentColor)
        }
    }
}

struct HomeView: View {
    @State private var animate = false
    @State private var showLiveTrainingView = false
    
    let trendColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 32.0) {
                    VStack(spacing: 8.0) {
                        SectionHeader(title: "Aktivität")
                        ActivityStatsView()
                    }
                    
                    VStack(spacing: 8.0) {
                        LiveTrainingRowView()
                            .onTapGesture {
                                showLiveTrainingView = true
                            }
                            .sheet(isPresented: $showLiveTrainingView) {
                                LiveTrainingView()
                            }
                    }
                    
                    VStack(spacing: 8.0) {
                        SectionHeader(title: "Trainings")
                        
                        VStack(spacing: 4.0) {
                            ForEach(trainings) {training in
                                NavigationLink(destination: TrainingDetailView(training: training)) {
                                    TrainingRowView(training: training)
                                }
                            }
                        }
                    }
                    
                    VStack(spacing: 8.0) {
                        SectionHeader(title: "Achtsamkeit")
                        MindfullnessRowView()
                    }
                    
                    VStack(spacing: 8.0) {
                        SectionHeader(title: "Trends")
                        TrendView()
                    }
                }
            }
            .navigationTitle("Übersicht")
            .padding(.horizontal)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
