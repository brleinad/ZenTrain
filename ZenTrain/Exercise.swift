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
    var sets: [ExerciseSet]
    
    init(exercise: String, timestamp: Date) {
        self.exercise = exercise
        self.timestamp = timestamp
        self.sets = []
    }
}


@Model
final class ExerciseSet {
    var reps: Int
    var weight: Int
    
    init(reps: Int, weight: Int) {
        self.reps = reps
        self.weight = weight
    }
}
