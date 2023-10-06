//
//  BookManager.swift
//  bookscrool
//
//  Created by Soph Codes on 10/4/23.
//

import Foundation



// Struct to store chapter info
struct Chapter: Codable {
    let title: String
    let text: String
    let next: URL?
}

// Struct to store the book info
struct Book: Codable {
    let id: Int
    let title: String
    let chapter_set: [Chapter]?
}

class BookManager {
    var book: Book?
    var books: [Book]?
    
    func getBooks(completionHandler: @escaping ([Book]) -> Void) {
        print("Getting books")
        
        let url = URL(string: "https://octopus-app-2tf3v.ondigitalocean.app/bookscroll/books/?format=json")!
        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error with fetching books: \(error)")
//                return
//            }
//            
//            if let data = data, let string = String(data: data, encoding: .utf8){
//                print(string)
//            }
//        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error with fetching books: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            if let data = data {
                do {
                    let books = try JSONDecoder().decode([Book].self, from: data)
                    
                    completionHandler(books)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        
        task.resume()
    }
    
    
    
    func setBook(book: Book) {
        self.book = book
    }
    
    func setBooks(books: [Book]) {
        self.books = books
    }
}

