//
//  ContentView.swift
//  NotificationTest
//
//  Created by Pete Schwamb on 4/15/20.
//  Copyright © 2020 Tidepool. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    func issueNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Weekly Staff Meeting"
        content.body = "Every Tuesday at 2pm"
        content.userInfo = ["MEETING_ID" : "something",
                            "USER_ID" : "userid" ]
        content.categoryIdentifier = "MEETING_INVITATION"
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                    content: content, trigger: nil)
        
        
        UNUserNotificationCenter.current().add(request) { (error) in
            print("notification completion handler: \(String(describing: error))")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            Button(action: {
                self.issueNotification()
            }) {
                Text("Issue Notification")
                    .foregroundColor(Color.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
