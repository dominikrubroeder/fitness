//
//  TrainingData.swift
//  fitness
//
//  Created by Dominik Rubröder on 04.05.22.
//

import Foundation

struct Training: Identifiable {
    let id = UUID()
    let type: String
    let title: String?
    let date: Date
    let icon: String
    let location: String
    let timeSpan: String
    let timeTotal: String
    let caloriesTotal: Int
    let caloriesActivity: Int
    let heartRateAverage: Int
    let weatherCelcius: Int
    let weatherImage: String
    let weatherMoisture: Int
    let tags: [String]
    let gym: String
}

let trainings: [Training] = [
    Training(type: "Traditionelles Krafttraining", title: "Push", date: Date(), icon: "figure.walk", location: "Wolfratshausen", timeSpan: "17:25 - 19:25", timeTotal: "2:00:15", caloriesTotal: 988, caloriesActivity: 795, heartRateAverage: 121, weatherCelcius: 17, weatherImage: "sun.max.fill", weatherMoisture: 32, tags: ["push", "week 3"], gym: "Clever fit Wolfratshausen"),
    Training(type: "Traditionelles Krafttraining", title: "Push", date: Date(), icon: "figure.walk", location: "Wolfratshausen", timeSpan: "17:25 - 19:25", timeTotal: "2:00:15", caloriesTotal: 988, caloriesActivity: 795, heartRateAverage: 121, weatherCelcius: 17, weatherImage: "sun.max.fill", weatherMoisture: 32, tags: ["push", "week 3"], gym: "Clever fit Wolfratshausen"),
    Training(type: "Traditionelles Krafttraining", title: "Push", date: Date(), icon: "figure.walk", location: "Wolfratshausen", timeSpan: "17:25 - 19:25", timeTotal: "2:00:15", caloriesTotal: 988, caloriesActivity: 795, heartRateAverage: 121, weatherCelcius: 17, weatherImage: "sun.max.fill", weatherMoisture: 32, tags: ["push", "week 3"], gym: "Clever fit Wolfratshausen")
]
