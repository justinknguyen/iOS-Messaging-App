//
//  ChatRow.swift
//  dm
//
//  Created by Justin Nguyen on 2022-05-20.
//

import SwiftUI

struct ChatRow: View {
    
    let chat: Chat
    
    var body: some View {
        HStack (spacing: 20) {
            // Unread message circle
            Circle()
                .foregroundColor(chat.hasUnreadMessage ? .blue : .clear)
                .frame(width: 14, height: 14)
                .frame(alignment: .leading)
            
            // PFP of contact
            Image(systemName: chat.person.imgString) //remove systemName
                .resizable()
                .frame(width: 50, height: 50)
                .frame(alignment: .trailing)
                .clipShape(Circle())
            
            ZStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        // Name of contact
                        Text(chat.person.name)
                            .bold()
                        
                        Spacer()
                        
                        // Date of message
                        Text(chat.messages.last?.date.descriptiveString() ?? "")
                    }
                    
                    HStack {
                        // Message box preview
                        Text(chat.messages.last?.text ?? "")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)
                    }
                }
                
                
            }
        }
        .frame(height: 80)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat.sampleChat[0])
    }
}
