//
//  ReaderView.swift
//  bookscrool
//
//  Created by Soph Codes on 10/4/23.
//

import SwiftUI

struct ReaderView: View {
    @State var book: Book?
    @State var start_chapter_id: Int
    @State var curr_chapter_id: Int?
    @State var curr_chapter_height: Int?
    @State var chapters: [Chapter]? = []
    
    @State private var scroll_speed = 0.0
    @State private var curr_offset = 0.0

    func scroll() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            curr_offset += scroll_speed * 0.05
            
            scroll()
        }
    }
    
    var body: some View {
        ZStack {
            ScrollViewReader { scrollView in
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(chapters!) { chapter in
                            VStack {
                                Text(chapter.title)
                                    .font(.title2)
                                
                                Text(chapter.text)
                                    .font(.body)
                            }
                            .overlay(
                                GeometryReader { proxy in
                                    Color.clear.onAppear {
                                        curr_chapter_id = chapter.id
                                        print("curr_chapter_id: \(curr_chapter_id!)")
                                        print("chapter.id: \(chapter.id)")
                                    }
                                }
                            )
                            
                        }
                    }
                    .onAppear{
                        curr_chapter_id = start_chapter_id
                        
                        if book!.chapter_set!.count >= 3 {
                            chapters = Array(book!.chapter_set![start_chapter_id-1...start_chapter_id+1])
                        } else {
                            chapters = Array(book!.chapter_set![start_chapter_id-1...book!.chapter_set!.count])
                        }
                        
                        if start_chapter_id != 0 {
                            scrollView.scrollTo(start_chapter_id)
                        }
                    }
                    .onChange(of: scroll_speed, {
                        if scroll_speed != 0.0 {
                            scroll()
                        }
                        print("scroll_speed: \(scroll_speed)")
                    })
                    .onChange(of: curr_chapter_id, {
                        if curr_chapter_id != nil {
                            if book!.chapter_set!.count >= 3 {
                                chapters = Array(book!.chapter_set![start_chapter_id-1...curr_chapter_id!+1])
                            } else {
                                chapters = Array(book!.chapter_set![start_chapter_id-1...book!.chapter_set!.count])
                            }
                        }
                        print("curr_chapter_id: \(curr_chapter_id!)")
                    })
                    
                }
                .navigationTitle(book!.title)
                .padding(.horizontal)
            }
            HStack {
                Slider(value: $scroll_speed, in: -1...1, step: 0.2)
                    .accessibilityLabel("Scroll Speed")
                .tint(.accentColor)
                .rotationEffect(.degrees(-90), anchor: .bottomTrailing)
                .opacity(0.5)
            }
            .padding()
        }
        
    }
        
}

let chapter1 = Chapter(id: 1, title: "Communication and Companionship", text: "\nDogs have a unique ability to communicate and connect with humans on an emotional level. \n\nThey use a combination of body language, vocalizations, and facial expressions to convey their feelings and needs. \n\nWhether it's the joyful wagging of a tail when their owner returns home or the empathetic nuzzling when someone is upset, dogs have an uncanny way of understanding and responding to human emotions. \n\nThis deep bond between humans and dogs provides a source of companionship and support that can be profoundly comforting.", next: nil)
let chapter2 = Chapter(id: 2, title: "\nHunting and Sporting Breeds", text: "\nMany dog breeds were originally developed for specific purposes, such as hunting or retrieving game. \n\nSporting breeds like Labrador Retrievers and German Pointers have exceptional stamina, agility, and scenting abilities, making them invaluable hunting companions. \n\nThey excel in tracking, flushing, and retrieving game for hunters. \n\nThese breeds are not only skilled working dogs but also loving family pets, known for their friendly and outgoing nature.", next: nil)
let chapter3 = Chapter(id: 3, title: "\nDogs in Popular Culture", text: "\nDogs hold a special place in popular culture and have been featured in countless books, movies, and television shows. \n\nFrom classic tales like \"Lassie\" and \"Old Yeller\" to animated characters like Scooby-Doo, dogs have captured the hearts of audiences worldwide. \n\nTheir roles in these stories often reflect their real-life qualities of loyalty, bravery, and unwavering friendship. \n\nBeyond fictional depictions, famous dogs like Hachiko, the loyal Akita from Japan, and Balto, the Siberian Husky who led the Nome Serum Run, have become legendary symbols of canine devotion and heroism.\n\nDogs continue to be cherished members of households around the globe, providing love, laughter, and a sense of purpose to their owners. \n\nTheir incredible range of talents, their ability to communicate, and their enduring presence in our lives make them truly remarkable and irreplaceable companions.", next: nil)
let chapter4 = Chapter(id: 4, title: "\nCanine Health and Care", text: "\nTaking care of a dog involves more than just providing food and shelter. Canine health is a top priority for responsible pet owners. Regular vet check-ups, vaccinations, and preventive care are essential to ensure your furry friend's well-being.\n\nDogs require proper nutrition to thrive, with specific dietary needs based on their breed and size. A balanced diet helps maintain their energy levels, coat health, and overall vitality. In addition to physical care, mental stimulation through play, training, and socialization is crucial to prevent boredom and behavioral issues.\n\nUnderstanding common health issues like fleas, ticks, and dental problems can help you keep your dog in the best shape possible. By providing love, care, and attention, you'll ensure your four-legged companion enjoys a long and healthy life.", next: nil)
let chapter5 = Chapter(id: 5, title: "\nDog Breeds Around the World", text: "\nDogs come in a fascinating array of breeds, each with its own unique characteristics and history. From the elegant Greyhound to the spirited Australian Shepherd, there's a breed to suit every lifestyle and preference.\n\nSome breeds are known for their intelligence, like the Border Collie, which excels in obedience and agility training. Others, like the Siberian Husky, are renowned for their endurance and love of cold weather. Breeds such as the Poodle and Bichon Frise are prized for their hypoallergenic coats, making them a great choice for allergy sufferers.\n\nExploring the world of dog breeds is a captivating journey, with each one offering its own set of traits and quirks. Whether you're looking for a loyal companion, a working dog, or a playful family pet, there's a breed that's perfect for you.", next: nil)
let chapter6 = Chapter(id: 6, title: "\nDogs and Human History", text: "\nDogs have played a significant role in human history for thousands of years. Their partnership with humans dates back to ancient times when they were used for hunting, herding, and guarding.\n\nIn the modern era, dogs have served as search and rescue heroes, police and military companions, and even as therapy animals providing comfort to those in need. Their unwavering loyalty and versatility have made them indispensable in various human endeavors.\n\nSome notable historical dogs include Balto, who led the famous serum run to Nome in 1925, and Sergeant Stubby, a decorated war dog who served during World War I. These stories highlight the enduring bond between humans and dogs and the incredible feats they've accomplished together throughout history.\n\nFeel free to use these additional chapters for your test data or let me know if you need more content.", next: nil)

let book = Book(id: 1, title: "Dogs: Man's Best Friend", chapter_set: [chapter1, chapter2, chapter3, chapter4, chapter5, chapter6])

#Preview {
    ReaderView(book: book, start_chapter_id: 1)
}
