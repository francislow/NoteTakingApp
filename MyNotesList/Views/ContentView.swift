//
//  ContentView.swift
//  MyNotesList
//
//  Created by Francis Low on 9/3/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var notesViewModel: NotesViewModel = NotesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.notesViewModel.notes) { note in
                    NavigationLink(destination: EditNoteView(notesViewModel: notesViewModel, noteId: note.id, currentNoteTitle: note.title, currentNoteDesc: note.desc)) {
                        Text(note.title)
                    }
                }
                .onDelete(perform: self.notesViewModel.deleteNote)
            }
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: NewNoteView(notesViewModel: notesViewModel)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
