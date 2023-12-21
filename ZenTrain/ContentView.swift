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
                ForEach(logs) { log in
                    NavigationLink {
                        Text("\(log.exercise)")
                    } label: {
                        Text(log.exercise)
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

    private func addLog() {
        withAnimation {
            let newLog = ExerciseLog(exercise: "20mm",
                                     timestamp: Date(),
                                     sets: 1,
                                     reps: 1,
                                     weight: 69
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
