//
//  Exercise.swift
//  ZenTrain
//
//  Created by Daniel RB on 2023-12-20.
//

import Foundation
import SwiftData

@Model
final class ExerciseLog {
    var exercise: String
    var timestamp: Date
    var sets: Int
    var reps: Int
    var weight: Int
    
    init(exercise: String, timestamp: Date, sets: Int, reps: Int, weight: Int) {
        self.exercise = exercise
        self.timestamp = timestamp
        self.sets = sets
        self.reps = reps
        self.weight = weight
    }
}
