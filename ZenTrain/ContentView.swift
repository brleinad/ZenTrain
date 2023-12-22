//
//  ContentView.swift
//  ZenTrain
//
//  Created by Daniel RB on 2023-12-20.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var logs: [ExerciseLog]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(logs) { exerciseLog in
                    HStack{
                        Text("\(exerciseLog.exercise)")
                        Spacer()
                        Button(action: { addSet(for: exerciseLog) }) {
                            Label("", systemImage: "plus")
                        }
                    }
                    ForEach(exerciseLog.sets) { exerciseSet in
                        HStack{
                            Text("\(exerciseSet.weight) x \(exerciseSet.reps)")
                            Spacer()
                            Button(action: { addRep(for: exerciseSet) }) {
                                Label("", systemImage: "plus")
                            }
                        }
                    }
                }
                .onDelete(perform: deleteLog)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addLog) {
                        Label("Add Log", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    private func addSet(for log: ExerciseLog) {
        let newSet = ExerciseSet(reps: 0, weight: 69)
        log.sets.append(newSet)
    }
    
    private func addRep(for set: ExerciseSet) {
        set.reps += 1
    }
    
    private func reduceRep(for set: ExerciseSet) {
        set.reps -= 1
    }
    
    
    private func addLog() {
        withAnimation {
            let newLog = ExerciseLog(exercise: "20mm",
                                     timestamp: Date()
            )
            modelContext.insert(newLog)
        }
    }
    
    private func deleteLog(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(logs[index])
            }
        }
    }
}



#Preview {
    ContentView()
        .modelContainer(for: ExerciseLog.self, inMemory: true)
}
