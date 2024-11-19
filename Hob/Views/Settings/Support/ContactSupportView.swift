//
//  ContactSupportView.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//

import SwiftUI

struct ContactSupportView : View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Votre satisfaction est notre priorité. Si vous avez des questions, des suggestions pour améliorer la qualité de notre service, ou si vous rencontrez un souci avec votre compte, nous sommes là pour vous. Cliquez simplement sur la carte ci-dessous pour nous contacter. Notre équipe se fera un plaisir de vous répondre dans les plus brefs délais. Merci de nous faire confiance.")
                .lineSpacing(6)
                .font(Font.custom("BRSonoma-Regular", size: 15))
                .padding(.vertical, 12)
            
            SettingField(fieldName: "Adresse mail", field: "contact@hobdating.com") {
                sendEmail()
            }
            Spacer()
        }
        .navigationTitle("Contacter le support")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal, 20)
    }
    
    func sendEmail() {
        let email = "contact@hobdating.com"
        let subject = "[SUPPORT]"
        
        if let url = createEmailUrl(to: email, subject: subject) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                print("Mail app is not available or unable to open mail URL.")
            }
        }
    }
    
    func createEmailUrl(to: String, subject: String) -> URL? {
        let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "mailto:\(to)?subject=\(subjectEncoded)"
        return URL(string: urlString)
    }
}
