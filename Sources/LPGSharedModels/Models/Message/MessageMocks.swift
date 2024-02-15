//
//  File.swift
//  
//
//  Created by Saroar Khandoker on 07.08.2022.
//

import Foundation
import BSON

func randomRecentDate() -> Date {
    let now = Date()
    let secondsInAYear: TimeInterval = 365 * 24 * 60 * 60
    let randomTimeInterval = TimeInterval.random(in: -secondsInAYear...0)
    return now.addingTimeInterval(randomTimeInterval)
}

extension MessageItem {
    static public let messageItem1 = MessageItem(
        id: ObjectId("5f96c378d6b5590459f0cd68")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!, 
        swap: nil,
        messageBody: "Hey, how's it going?",
        messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withFirstName,
        recipient: nil,
        createdAt: Date(),
        updatedAt: Date()
    )

    static public let messageItem2 = MessageItem(
        id: ObjectId("5f96c381396c401b86d6db68")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!, 
        swap: nil,
        messageBody: "Same here, diving into SwiftUI. It's quite something.",
        messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withFirstName,
        recipient: nil,
        createdAt: randomRecentDate(),
        updatedAt: randomRecentDate()
    )

    static public let messageItem3 = MessageItem(
        id: ObjectId("5f96c4141f59a5ec9a9f9f05")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!, 
        swap: nil,
        messageBody: "Pretty good, thanks! Just working on some coding projects. You?",
        messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withLastName,
        recipient: nil,
        createdAt: randomRecentDate(),
        updatedAt: randomRecentDate()
    )

    static public let messageItem4 = MessageItem(
        id: ObjectId("5f9712990430e512e7dbfe6b")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
        swap: nil,
        messageBody: "Oh, nice! SwiftUI is on my list too. Found any good resources?",
        messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withLastName,
        recipient: nil,
        createdAt: randomRecentDate(),
        updatedAt: randomRecentDate()
    )

    static public let messageItem5 = MessageItem(
        id: ObjectId("5f9713d8c4b1856382b7bd86")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
        swap: nil,
        messageBody: "Yeah, I've been following a couple of online tutorials and the official Apple documentation. It's been helpful.",
        messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withLastName,
        recipient: nil,
        createdAt: randomRecentDate(),
        updatedAt: randomRecentDate()
    )

    static public let messageItem6 = MessageItem(
        id: ObjectId("5f9713d8c4b1956382b7bd86")!,
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
        swap: nil,
        messageBody: "Awesome, could you share the links?",
        messageType: .text,
        isRead: true,
        isDelivered: true,
        sender: .withNumber,
        recipient: nil,
        createdAt: randomRecentDate(),
        updatedAt: randomRecentDate()
    )
}

extension MessagePage {
    static public let draff: MessagePage = .init(
        items: [
            MessageItem.messageItem1, MessageItem.messageItem2,
            MessageItem.messageItem3, MessageItem.messageItem4,
            MessageItem.messageItem5, MessageItem.messageItem6,
        ],
      metadata: Metadata(per: 10, total: 6, page: 1)
    )
}

extension MessageItem {

    static let swap: SwapOutput = .init(
            id: .init(),
            title: "Car and Dolls Car and Dolls Car and Dolls Car and DollsCar and DollsCar and Dolls",
            details: "awesome car",
            distance: 0.9, status: .available,
            addressName: "some address goes here",
            geometry: .near,
            sponsored: true,
            overlay: false,
            owner: .withAttachments,
            conversationId: .init(),
            categoryId: .init(),
            attachments: [.image1, .image2, .image3, .image4],
            urlString: "",
            createdAt: .now,
            updatedAt: .now
        )

    static public let messageItem = MessageItem(
        id: ObjectId(),
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
        swap: nil,
        messageBody: "I'm looking forward to our meeting.",
        messageType: .text,
        isRead: false,
        isDelivered: true,
        sender: .withFirstName,
        recipient: nil,
        createdAt: .now,
        updatedAt: .now
    )

    static public let messageItemWithSwap = MessageItem(
        id: ObjectId(),
        conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
        swap: swap,
        messageBody: "messageBody",
        messageType: .product,
        isRead: true,
        isDelivered: false,
        sender: .withAttachments,
        recipient: nil,
        createdAt: .now,
        updatedAt: .now
    )

    static public func generateMockMessages(count: Int) -> [MessageItem] {
        let validCount = max(1, min(count, 1000))
        var messages = [MessageItem]()

        var lastCreatedAt = randomRecentDate().addingTimeInterval(-Double(validCount * 60)) // Start from 'validCount' minutes ago

        for i in 1...validCount {
            let messageBody = generateHumanLikeMessage(for: i)
            let createdAt = lastCreatedAt.addingTimeInterval(60) // Increment by 1 minute for each message

            let swapgame = i % 2 == 0 ? swap : nil
            let messageItem = MessageItem(
                id: ObjectId(),
                conversationId: ObjectId("5f929515ba01cea941e2b2eb")!,
                swap: swapgame,
                messageBody: messageBody,
                messageType: swapgame == nil ? .text : .product,
                isRead: Bool.random(),
                isDelivered: Bool.random(),
                sender: i % 2 == 0 ? .withAttachments : .withFirstName,
                recipient: nil,
                createdAt: createdAt,
                updatedAt: createdAt
            )

            lastCreatedAt = createdAt // Update last created time for the next message
            messages.append(messageItem)
        }

        return messages
    }

    private static func generateHumanLikeMessage(for index: Int) -> String {
        // Sample messages - expand this list for more variety
        let sampleMessages = [
            "Hey, how are you doing?",
            "That's really interesting!",
            "I completely agree with you.",
            "Can we meet tomorrow?",
            "Thanks for your help!",
            "That was a great day!",
            "I'm looking forward to our meeting.",
            "Could you send me the file?",
            "Let's catch up soon!",
            "Take care and talk to you later!",
            "Just finished a great book!",
            "What's your plan for the weekend?",
            "I had a really good lunch today.",
            "Can you believe this weather?",
            "I've been thinking about your idea.",
            "How's your family doing?",
            "I saw a great movie last night.",
            "Do you have any recommendations for a good restaurant?",
            "I'm feeling a bit under the weather.",
            "Work has been so busy lately.",
            "I'm planning a small get-together, you in?",
            "How's your new project going?",
            "I need some advice on a problem I'm facing.",
            "I can't wait for our vacation!",
            "Do you prefer coffee or tea in the morning?",
            "I'm trying to learn a new language.",
            "Have you seen any good TV shows recently?",
            "I just got a new pet, want to see pictures?",
            "I've been getting into gardening lately.",
            "What's your favorite way to relax?",
            "I'm thinking of starting a blog.",
            "Have you ever been to Europe?",
            "I need some book recommendations.",
            "What sports do you enjoy watching?",
            "I'm looking for a good workout routine.",
            "Do you have any plans for the holidays?",
            "I'm thinking about changing my hairstyle.",
            "I just redecorated my room.",
            "Let's plan a road trip soon!",
            "Do you have any hobbies?",
            "I'm trying to eat healthier these days.",
            "Have you tried that new café downtown?",
            "I've been practicing yoga lately.",
            "I found a great hiking trail nearby.",
            "I'm thinking of learning to play the guitar.",
            "What's your favorite type of music?",
            "I just started a photography course.",
            "I'm planning to volunteer this weekend.",
            "I've been experimenting with new recipes.",
            "Let's go to a concert next month!"
        ]

        return sampleMessages[index % sampleMessages.count] // Cycle through sample messages
    }
}

// Usage example
let mockMessages = MessageItem.generateMockMessages(count: 50) // Generate 50 mock messages

extension MessagePage {
    static public func createDynamicMessagePage(count: Int, messagesPerPage: Int, pageNumber: Int) -> MessagePage {
        let mockMessages = MessageItem.generateMockMessages(count: count)
        let startIndex = (pageNumber - 1) * messagesPerPage
        let endIndex = min(startIndex + messagesPerPage, count)

        let pageItems = Array(mockMessages[startIndex..<endIndex])
        let totalPages = (count + messagesPerPage - 1) / messagesPerPage

        return MessagePage(
            items: pageItems,
            metadata: Metadata(per: messagesPerPage, total: count, page: pageNumber)
        )
    }
}

// Usage example
let dynamicMessagePage = MessagePage.createDynamicMessagePage(count: 50, messagesPerPage: 10, pageNumber: 1)
