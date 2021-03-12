//
//  NotesViewModel.swift
//  MyNotesList
//
//  Created by Francis Low on 11/3/21.
//

import Foundation
import SwiftUI
import Combine

class NotesViewModel : ObservableObject {
    @Published var notes: [Note]
    
    init() {
        // Fetch data from database
        let fetchedNotes = [
            Note(id: UUID().uuidString, title: "Note 1", desc: "This is a description 1"),
            Note(id: UUID().uuidString, title: "Note 2", desc: "This is a description 2"),
            Note(id: UUID().uuidString, title: "Note 3", desc: "This is a description 3"),
            Note(id: UUID().uuidString, title: "Note 4", desc: "This is a description 4"),
            Note(id: UUID().uuidString, title: "Note 5", desc: "This is a description 5"),
            Note(id: UUID().uuidString, title: "Note 6", desc: "This is a description 6")
        ]
        
        notes = fetchedNotes
    }
    
    func editNote(noteId: String, newNoteTitle: String, newNoteDesc: String) {
        // Remove current note
        var newNotes = notes.filter { note in
            note.id != noteId
        }
        
        // Add new note to the front of array
        newNotes.insert(Note(id: noteId, title: newNoteTitle, desc: newNoteDesc), at: 0)
        
        // Set
        notes = newNotes
    }
    
    func addNote(newNoteTitle: String, newNoteDesc: String) {
        notes.insert(Note(id: UUID().uuidString, title: newNoteTitle, desc: newNoteDesc), at: 0)
    }
    
    func deleteNote(at offsets : IndexSet) {
        notes.remove(atOffsets: offsets)
    }
}
