//
//  LibraryView.swift
//  bookscrool
//
//  Created by Soph Codes on 10/4/23.
//

import SwiftUI

struct LibraryView: View {
    
    @State var bookManager = BookManager()
    @State var books: [Book]?
    
    @State private var selected_chapter: Chapter?
    
    var body: some View {
        NavigationStack {
            if (books != nil) {
                List(books!) { book in
                    Menu {
                        ForEach(Array(book.chapter_set!.enumerated()), id: \.offset) { index, chapter in
                            NavigationLink(destination: ReaderView(book: book, start_chapter_id: index)) {
                                Text(String(index))
                            }
                        
                        }
                    } label: {
                        Label(book.title, systemImage: "book")
                            .foregroundColor(.black)
                    }
                
                }
                .navigationTitle("Books")
            
            } else {
                Text("Loading...")
            }

        }
        .onAppear {
            bookManager.getBooks { _books in
                books = _books
            }
        
        }
    }
}

#Preview {
    LibraryView()
}
