//
//  QuestionBank.swift
//  CyberMonkey
//
//  Created by Jonathan Yang on 3/8/18.
//  Copyright © 2018 Jonathan Yang. All rights reserved.
//

import Foundation

class TFQuestionBank {
    var list = [TFQuestion]()
    
    init() {
        /* Easy mode T/F Social Media */
        list.append(TFQuestion(questionText: "Should you always be nice and respectful when interacting with others on social media?", theme: "social media", correctAnswerText: 0, is_hardness: false))
        list.append(TFQuestion(questionText: "Clicking on all links shared on social media is safe.", theme: "social media", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "It's safe to accept friend requests from strangers on social media platforms.", theme: "social media", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "Is it okay to share private information, such as your home address, publicly on social media?", theme: "social media", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "You should never engage in cyberbullying or harassment on social media.", theme: "social media", correctAnswerText: 0, is_hardness: false))
        list.append(TFQuestion(questionText: "You should always read and understand the terms of service and privacy policy of a social media platform before signing up.", theme: "social media", correctAnswerText: 0, is_hardness: false))
        list.append(TFQuestion(questionText: "Social m edia posts and comments can have real-life consequences.", theme: "social media", correctAnswerText: 0, is_hardness: false))
        list.append(TFQuestion(questionText: "It's safe to share screenshots of private conversations without consent on social media.", theme: "social media", correctAnswerText: 1, is_hardness: false))
        
        /* Easy mode T/F Privacy*/
        list.append(TFQuestion(questionText: "\"password123\" is a good password choice.", theme: "privacy", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "\"qwerty\" is a strong and secure password.", theme: "privacy", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "\"P@ssw0rd!\" is a strong password.", theme: "privacy", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "\"123456\" is a strong password.", theme: "privacy", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "\"iloveyou\" is a good password because it's easy to remember.", theme: "privacy", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "A \"strong\" password is one that is easy to guess.", theme: "privacy", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "A \"strong\" password is difficult to guess and has uppercase letters and special characters.", theme: "privacy", correctAnswerText: 0, is_hardness: false))
        list.append(TFQuestion(questionText: "Clicking on all links shared on social media is safe.", theme: "privacy", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "A good password includes your name and birthdate.", theme: "privacy", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "It's safe to share your password with your friends.", theme: "privacy", correctAnswerText: 1, is_hardness: false))
        list.append(TFQuestion(questionText: "A \"strong\" password is one that is easy to guess.", theme: "privacy", correctAnswerText: 1, is_hardness: false))
        
        /* Hard T/F questions */
        list.append(TFQuestion(questionText: "Public Wi-Fi networks are always secure.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Providing personal information in response to a text message claiming you've won a prize is safe.", theme: "social media", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Downloading software from unknown sources is safe.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Granting apps permission to access your location enhances security.", theme: "social media", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Emails from unrecognized senders requesting sensitive information are trustworthy.", theme: "social media", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Connecting to public Wi-Fi without a VPN exposes your data to potential risks.", theme: "privacy", correctAnswerText: 1, is_hardness: true))
        list.append(TFQuestion(questionText: "Sharing passwords via email or text messages is secure.", theme: "social media", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Opening email attachments from unknown sources is safe.", theme: "social media", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Entering login credentials on unfamiliar websites is safe.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Clicking on pop-up ads offering free prizes is secure.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Allowing apps to access your contacts enhances privacy.", theme: "social media", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Sharing your location publicly on social media poses no risks.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Providing personal information over the phone to someone claiming to be from your bank is safe.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Public Wi-Fi networks without password protection are safe to use.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Responding to urgent requests for personal information is secure.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Installing browser extensions from untrusted sources is secure.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Ignoring software updates on your device poses no risks.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Accepting friend requests from unknown individuals on social media is safe.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
        list.append(TFQuestion(questionText: "Providing your email address to any website requesting it is safe.", theme: "privacy", correctAnswerText: 0, is_hardness: true))
    }
}

