//
//  NewNoteView.swift
//  MyNotesList
//
//  Created by Francis Low on 10/3/21.
//
import SwiftUI

struct NewNoteView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var notesViewModel : NotesViewModel
    @State private var newNoteTitle : String = ""
    @State private var newNoteDesc : String = ""
    
    var body: some View {
        VStack {
            Text("New Note")
                .font(.headline)
                .padding(5)
            
            TextField("Title", text: $newNoteTitle)
                .padding(10)
                .border(Color.gray)
            
            TextEditor(text: $newNoteDesc)
                .padding(10)
                .border(Color.gray)
            
            Button(action: {
                notesViewModel.addNote(newNoteTitle: newNoteTitle, newNoteDesc: newNoteDesc)
                navigateBack()
            }, label: {
                Text("Add Note")
            })
        }.padding()
    }
    
    func navigateBack() {
        mode.wrappedValue.dismiss()
    }
}
