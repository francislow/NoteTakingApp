//
//  EditNoteView.swift
//  MyNotesList
//
//  Created by Francis Low on 10/3/21.
//

import SwiftUI

struct EditNoteView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var notesViewModel : NotesViewModel
    var noteId : String
    @State var currentNoteTitle : String
    @State var currentNoteDesc : String
    
    var body: some View {
        VStack {
            Text("New Note")
                .font(.headline)
                .padding(5)
            
            TextField("Title", text: $currentNoteTitle)
                .padding(10)
                .border(Color.gray)
            
            TextEditor(text: $currentNoteDesc)
                .padding(10)
                .border(Color.gray)
            
            Button(action: {
                notesViewModel.editNote(noteId: noteId, newNoteTitle: currentNoteTitle, newNoteDesc: currentNoteDesc)
                navigateBack()
            }, label: {
                Text("Save")
            })
        }.padding()
    }
    
    func navigateBack() {
        mode.wrappedValue.dismiss()
    }
}
