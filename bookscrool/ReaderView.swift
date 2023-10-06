//
//  ReaderView.swift
//  bookscrool
//
//  Created by Soph Codes on 10/4/23.
//

import SwiftUI

struct ReaderView: View {
//    @State var book: Book?
//
    @State var book: Book?
    @State var start_chapter: Chapter?
    
    var body: some View {
        if book != nil {
                ScrollViewReader { scrollView in
                    ScrollView(.vertical) {
                        LazyVStack {
                            ForEach(book!.chapter_set!, id: \.title) { chapter in
                                VStack {
                                    Text(chapter.title)
                                        .font(.title2)
                                        
                                    Text(chapter.text)
                                        .font(.body)
                                }
                                
                            }
                        }
                        .onAppear{
                            if start_chapter != nil {
                                scrollView.scrollTo(start_chapter!.title)
                            }
                        }
                    }
                    .navigationTitle(book!.title)
                .padding(.horizontal)
                }
            }
        else {
                ScrollView{
                    VStack {
                        VStack {
                            Text("Communication and Companionship")
                                .font(.title2)
                            Text("\nDogs have a unique ability to communicate and connect with humans on an emotional level. \n\nThey use a combination of body language, vocalizations, and facial expressions to convey their feelings and needs. \n\nWhether it's the joyful wagging of a tail when their owner returns home or the empathetic nuzzling when someone is upset, dogs have an uncanny way of understanding and responding to human emotions. \n\nThis deep bond between humans and dogs provides a source of companionship and support that can be profoundly comforting.")
                                .font(.body)
                        }
                        VStack {
                            Text("\nHunting and Sporting Breeds")
                                .font(.title2)
                            Text("\nMany dog breeds were originally developed for specific purposes, such as hunting or retrieving game. \n\nSporting breeds like Labrador Retrievers and German Pointers have exceptional stamina, agility, and scenting abilities, making them invaluable hunting companions. \n\nThey excel in tracking, flushing, and retrieving game for hunters. \n\nThese breeds are not only skilled working dogs but also loving family pets, known for their friendly and outgoing nature.")
                                .font(.body)
                        }
                        VStack {
                            Text("\nDogs in Popular Culture")
                                .font(.title2)
                            Text("\nDogs hold a special place in popular culture and have been featured in countless books, movies, and television shows. \n\nFrom classic tales like \"Lassie\" and \"Old Yeller\" to animated characters like Scooby-Doo, dogs have captured the hearts of audiences worldwide. \n\nTheir roles in these stories often reflect their real-life qualities of loyalty, bravery, and unwavering friendship. \n\nBeyond fictional depictions, famous dogs like Hachiko, the loyal Akita from Japan, and Balto, the Siberian Husky who led the Nome Serum Run, have become legendary symbols of canine devotion and heroism.\n\nDogs continue to be cherished members of households around the globe, providing love, laughter, and a sense of purpose to their owners. \n\nTheir incredible range of talents, their ability to communicate, and their enduring presence in our lives make them truly remarkable and irreplaceable companions.")
                                .font(.body)
                        }
                    }
                }
                .navigationTitle("Dogs: Man's Best Friend")
                .padding(.horizontal)
            }

            
        }
        
}

#Preview {
    ReaderView()
}
