//
//  ViewA.swift
//  dm
//
//  Created by Justin Nguyen on 2022-05-20.
//

import SwiftUI

struct ViewA: View {
   
    @StateObject var viewModel = ChatsViewModel()
    
    @State private var query = ""

    var body: some View {
        ZStack {
            Color.white
            
            Image(systemName: "message.fill")
                .foregroundColor(Color.blue)
                .font(.system(size: 100.0))
            
            NavigationView {
                List {
                    ForEach(viewModel.getSortedFilteredChats(query: query)) { chat in
                        
                        ZStack {
                            ChatRow(chat: chat)
                            NavigationLink(destination: {
                                ChatView(chat: chat)
                                    .environmentObject(viewModel)
                            }) {
                                EmptyView()
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: 0)
                            .opacity(0)
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button(action: {
                                viewModel.markAsUnread(!chat.hasUnreadMessage, chat: chat)
                            }) {
                                if chat.hasUnreadMessage {
                                    Label("Read", systemImage: "text.bubble")
                                } else {
                                    Label("Unread", systemImage: "circle.fill")
                                }
                            }
                            .tint(.blue)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .searchable(text: $query)
                .navigationTitle("Messages")
                //.navigationBarItems(trailing: Button(action: {}) {
                   // Image(systemName: "square.and.pencil")
                //})
            }
        }
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}
