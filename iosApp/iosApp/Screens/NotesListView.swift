//
//  NotesListView.swift
//  iosApp
//
//  Created by Joyson P S on 14/12/22.
//  Copyright © 2022 orgName. All rights reserved.
//


import SwiftUI
import shared

struct NotesListView: View {
    private var noteDataSource: NoteDataSource
    @StateObject var viewModel = NoteListViewModel(noteDataSource: nil)
    
    @State private var isNoteSelected = false
    @State private var selectedNoteId: Int64? = nil
    
    init(noteDataSource: NoteDataSource) {
        self.noteDataSource = noteDataSource
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HidableSeachTextField<NoteDetailScreen>(onSearchToggled: {
                    viewModel.toggleIsSearchActive()
                }, destinationProvider: {
                    NoteDetailScreen(
                        noteDataSource: noteDataSource,
                        noteId: selectedNoteId
                    )
                }, isSearchActive: viewModel.isSearchActive, searchText: $viewModel.searchText)
                .frame(width: 300, height: 60, alignment: .center)
                .padding()

                
                List {
                    ForEach(viewModel.filteredNotes, id: \.self.id) { note in
                        ZStack{
                            NavigationLink(destination: NoteDetailScreen(noteDataSource: self.noteDataSource, noteId: note.id?.int64Value)) {
                            }
                            .hidden()
                        }
                        
                      
                        NoteItem(note: note, onDeleteClick: {
                            viewModel.deleteNoteById(id: note.id?.int64Value)
                        })

                    }
                }
                .onAppear {
                    viewModel.loadNotes()
                }
            }
            .navigationBarHidden(true)
            
//            .navigationTitle("Notes")
        }
        .onAppear {
            viewModel.setNoteDataSource(noteDataSource: noteDataSource)
        }
        
        
    }
}

struct NoteListScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
