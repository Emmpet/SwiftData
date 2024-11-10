//
//  ContentView.swift
//  SwiftUppg4
//
//  Created by Emmelie Elisabeth Gabriella Petersson on 2024-11-10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @Query private var allToDo: [ToDo]
    
    @State var addToDo = ""

    var body: some View {
        NavigationSplitView {
            
            TextField("Add ToDo", text: $addToDo)
            Button(action: addItem) {
                Text("Add")
            }
            
            List {
                ForEach(allToDo.sorted(by: { !$0.done && $1.done })) { item in
                    Button(action : {
                        toggleDone(for : item)
                    }) {
                        
                        HStack {
                            Image(systemName: item.done ? "checkmark.circle.fill" : "circle")
                            Text(item.name)
                        } 
                    }
                }
                .onDelete(perform: deleteItems) 
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            
            let newToDo = ToDo(name: addToDo, done: false)
            modelContext.insert(newToDo)
            addToDo = ""
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(allToDo[index])
            }
        }
    }
    
    private func toggleDone(for item: ToDo) {
            if let index = allToDo.firstIndex(where: { $0.id == item.id }) {
                allToDo[index].done.toggle()
                try? modelContext.save()
            }
        }
}

#Preview {
    ContentView()
        .modelContainer(for: ToDo.self, inMemory: true)
}
