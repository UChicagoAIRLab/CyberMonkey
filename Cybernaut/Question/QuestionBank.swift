//
//  QuestionBank.swift
//  CyberMonkey
//
//  Created by Jonathan Yang on 3/8/18.
//  Copyright © 2018 Jonathan Yang. All rights reserved.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    
    init() {

        /* Easy Social Media Questions */
        list.append(Question(questionText: "What should you do if someone you don't know asks for your personal information online?", choiceA: "Share it with them because they asked nicely", choiceB: "Ignore the request and tell a trusted adult", choiceC: "Tell them to ask again later", choiceD: "Ask them for their information first", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "How can you protect your online privacy?", choiceA: "Share your password with friends", choiceB: "Keep personal information private", choiceC: "Post everything you do online", choiceD: "Accept friend requests from everyone", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do if you see someone being bullied on social media?", choiceA: "Join in and make fun of them", choiceB: "Report the bullying using the Report button", choiceC: "Ignore it and hope it stops", choiceD: "Share the bullying content with friends", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do if someone you don't know adds you as a friend on social media?", choiceA: "Accept the request immediately", choiceB: "Decline the request and tell a trusted adult", choiceC: "Ask them why they want to be friends", choiceD: "Share personal information with them", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do before you post something on social media?", choiceA: "Think about how it would make you feel if someone said or did the same thing to you.", choiceB: "Ask yourself if you would be okay with your parents seeing it.", choiceC: "Just post it without thinking about it.", choiceD: "Ask your followers if it's okay to post it.", correctAnswerText: 0, is_hardBool: false))

        list.append(Question(questionText: "What kind of information should you avoid sharing publicly on social media?", choiceA: "Your favorite food", choiceB: "Your home address", choiceC: "Your favorite color", choiceD: "Your favorite book", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do if someone sends you a mean message on social media?", choiceA: "Send an even meaner message back", choiceB: "Ignore it and hope it stops", choiceC: "Report the message and tell a trusted adult", choiceD: "Share the message with your friends for support", correctAnswerText: 2, is_hardBool: false))

        list.append(Question(questionText: "What should you do if you accidentally share something online that you didn't mean to?", choiceA: "Throw away your computer", choiceB: "Pretend it didn't happen and ignore it", choiceC: "Quickly delete the post and tell a trusted adult", choiceD: "Share even more to distract from the mistake", correctAnswerText: 2, is_hardBool: false))

        list.append(Question(questionText: "Why is it important to keep your passwords a secret?", choiceA: "So you can share them with your friends", choiceB: "To keep your accounts safe from hackers", choiceC: "Because everyone else knows them already", choiceD: "So you don't forget them", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What is a social media hacker?", choiceA: "Someone who helps you post", choiceB: "Someone who breaks your computer", choiceC: "Someone who steals your social media account", choiceD: "Friends on social media who you don’t like", correctAnswerText: 2, is_hardBool: false))
        
        /* Hard Social Media Questions */
        list.append(Question(questionText: "Why is it important to ask permission before tagging someone in a photo?", choiceA: "Because it's more fun to surprise them", choiceB: "To respect their privacy and feelings", choiceC: "So they feel famous and popular", choiceD: "It's not important; just tag them whenever you want", correctAnswerText: 1, is_hardBool: true))

        list.append(Question(questionText: "What should you do if you think your social media account has been hacked?", choiceA: "Do nothing and hope it gets better on its own", choiceB: "Post about it on your timeline to get help", choiceC: "Change your password immediately and tell a trusted adult", choiceD: "Delete your account and make a new one with the same name", correctAnswerText: 2, is_hardBool: true))

        list.append(Question(questionText: "What are your social media privacy settings?", choiceA: "Tools to help you get more followers", choiceB: "Controls to help you manage who sees your posts", choiceC: "A timer to stop you from spending too much time online", choiceD: "A list of all your friends on social media", correctAnswerText: 1, is_hardBool: true))

        list.append(Question(questionText: "Someone you don’t know sent you a message, they want to gift you an Amazon gift card. You:", choiceA: "Always trust the people giving you big prizes for free", choiceB: "Send this person a friend request", choiceC: "Share this offer with all your friends to increase your chances of winning", choiceD: "Ignore the message and block the user", correctAnswerText: 3, is_hardBool: true))

        list.append(Question(questionText: "What steps can you take to protect your privacy when using location services on social media?", choiceA: "Share your location with everyone to let them know where you are", choiceB: "Only use location services when absolutely necessary", choiceC: "Share your location with strangers to make new friends", choiceD: "Constantly update your location for fun", correctAnswerText: 1, is_hardBool: true))

        list.append(Question(questionText: "How can you protect yourself from identity theft on social media?", choiceA: "By sharing your personal information with everyone", choiceB: "By always updating your profile with new information", choiceC: "By using strong, unique passwords and only talking to people you know", choiceD: "By talking to everyone you can, even if you don’t know them", correctAnswerText: 2, is_hardBool: true))

        /* Easy User Privacy Questions */
        list.append(Question(questionText: "What is user privacy?", choiceA: "Sharing personal information with everyone", choiceB: "Keeping personal information to yourself", choiceC: "Deleting all social media accounts", choiceD: "Writing comments on social media posts", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "Why is it important to protect user privacy?", choiceA: "To make friends online", choiceB: "To share personal information with strangers", choiceC: "To stop hackers from stealing your personal information", choiceD: "To increase social media followers", correctAnswerText: 2, is_hardBool: false))

        list.append(Question(questionText: "What is personal information?", choiceA: "Your favorite color", choiceB: "Your favorite food", choiceC: "The city you were born in", choiceD: "Your favorite movie", correctAnswerText: 2, is_hardBool: false))

        list.append(Question(questionText: "What is personal information?", choiceA: "Your mother's maiden name", choiceB: "The color of your bedroom", choiceC: "Your favorite vacation", choiceD: "Your best friend's favorite book", correctAnswerText: 0, is_hardBool: false))

        list.append(Question(questionText: "Which of the following is considered personal information?", choiceA: "Your birthdate", choiceB: "The name of your favorite restaurant", choiceC: "The title of the last book you read", choiceD: "The color of your backpack", correctAnswerText: 0, is_hardBool: false))

        list.append(Question(questionText: "Why should you be careful about sharing your location online?", choiceA: "Because it can help strangers find out where you are", choiceB: "Because it can make you popular", choiceC: "Because it makes it easier to meet new friends", choiceD: "Because everyone else is doing it", correctAnswerText: 0, is_hardBool: false))

        list.append(Question(questionText: "How can you stop sharing your location on social media?", choiceA: "Go to your account settings and turn off the location option", choiceB: "Tell your friends where you are", choiceC: "Keep posting updates about your location", choiceD: "Share your location with everyone", correctAnswerText: 0, is_hardBool: false))

        list.append(Question(questionText: "What does sharing your location do?", choiceA: "It means telling your friends what you ate for lunch", choiceB: "It means letting everyone know where you are, like a park or a restaurant", choiceC: "It means changing your profile picture", choiceD: "It means sending messages to your friends", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "When might you want to turn on location services for some time?", choiceA: "When you're lost and need directions", choiceB: "When you want to keep your location private", choiceC: "When you want to share your location with friends all the time", choiceD: "When you're not using your phone", correctAnswerText: 0, is_hardBool: false))

        list.append(Question(questionText: "What should you do if a stranger asks for your location online?", choiceA: "Ignore the request and tell a trusted grown up", choiceB: "Immediately share your location to be helpful", choiceC: "Ask them why they need your location", choiceD: "Share your location and ask for theirs in return", correctAnswerText: 0, is_hardBool: false))

        /* Hard User Privacy Questions */
        list.append(Question(questionText: "Why is it important to review and update your privacy settings?", choiceA: "To ensure your information is only seen by people you trust", choiceB: "To increase your followers on social media", choiceC: "To make your profile more popular", choiceD: "To share more personal details with strangers online", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "What is phishing?", choiceA: "Sending a message to a friend asking for their favorite color", choiceB: "A fake link that helps scammers steal your personal information", choiceC: "Sharing funny memes with your online friends", choiceD: "Asking someone for their password to access their account", correctAnswerText: 1, is_hardBool: true))

        list.append(Question(questionText: "How can you recognize a secure website when making online purchases?", choiceA: "Look for a padlock symbol in the browser's address bar", choiceB: "Click on every link and advertisement on the website", choiceC: "Try to buy the things that you like", choiceD: "Ignore any security warnings that pop up", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "What is one method to protect your personal information online?", choiceA: "Sharing your passwords with friends", choiceB: "Writing your passwords on sticky notes and leaving them on your desk", choiceC: "Creating passwords with many letters, numbers, and special characters", choiceD: "Creating passwords based on your name or birthday", correctAnswerText: 2, is_hardBool: true))
        
        list.append(Question(questionText: "Why should you be careful about clicking on links from unknown senders?", choiceA: "Because it might lead to downloading a virus on your device", choiceB: "Because it's a fun way to discover new websites", choiceC: "Because it helps increase your online popularity", choiceD: "Because everyone else does it too", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "What is a virus?", choiceA: "A type of code that protects your computer from hackers", choiceB: "A tiny animal that makes you sick", choiceC: "A type of online game you can play with friends", choiceD: "A malicious program that can steal your information", correctAnswerText: 3, is_hardBool: true))

        list.append(Question(questionText: "How can you tell if your computer might have a virus?", choiceA: "Your computer starts running faster", choiceB: "You receive a lot of emails from friends", choiceC: "Your computer crashes all the time", choiceD: "Your internet connection becomes faster", correctAnswerText: 2, is_hardBool: true))

        list.append(Question(questionText: "What is Wi-Fi?", choiceA: "A type of food you can eat", choiceB: "A device you use to make phone calls", choiceC: "A wireless technology you use to connect to the Internet", choiceD: "A type of music you listen to online", correctAnswerText: 2, is_hardBool: true))

        list.append(Question(questionText: "What is the difference between public and private Wi-Fi?", choiceA: "Public Wi-Fi is free to use, while private Wi-Fi needs money", choiceB: "Public Wi-Fi is for everyone, while private Wi-Fi needs a password", choiceC: "Public Wi-Fi is faster than private Wi-Fi", choiceD: "Public Wi-Fi is safer than private Wi-Fi", correctAnswerText: 1, is_hardBool: true))

        list.append(Question(questionText: "How should you be careful when using public Wi-Fi?", choiceA: "By sharing your personal information freely", choiceB: "By avoiding logging into any accounts", choiceC: "By connecting to public Wi-Fi networks without any passwords", choiceD: "By allowing others to use your phone", correctAnswerText: 1, is_hardBool: true))

        /* Digital Footprint Hard Questions */
        list.append(Question(questionText: "What is a digital footprint?", choiceA: "Everything you do on the Internet publicly", choiceB: "The amount of time you spend on the internet each day.", choiceC: "The number of friends you have on social media.", choiceD: "Your passwords for Facebook and Instagram.", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "What can add to your digital footprint?", choiceA: "The websites you visit, the emails you send, and the posts you make on social media.", choiceB: "The computer model you have.", choiceC: "Your passwords for Facebook and Instagram.", choiceD: "A downloaded song on your computer.", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "Why is it important to know your digital footprint?", choiceA: "Because it can affect your reputation and privacy.", choiceB: "Because it can be used to hack into your social media accounts.", choiceC: "Because it is sent to your parents as a letter every month.", choiceD: "Because it is checked by your teachers and graded.", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "What are some ways to protect your digital footprint?", choiceA: "Use strong passwords with many letters and numbers.", choiceB: "Keep your software up to date.", choiceC: "Always buy the latest model of the computer brand you’re using.", choiceD: "Be careful about what information you share online.", correctAnswerText: 3, is_hardBool: true))

        list.append(Question(questionText: "What is a cookie?", choiceA: "A small piece of data that a website stores on your computer when you visit the site.", choiceB: "A type of hacking to steal your personal information.", choiceC: "A type of online advertising.", choiceD: "A type of post on social media.", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "Why should we be careful with cookies?", choiceA: "Because they can be easily eaten by mistake.", choiceB: "Because they can track our online activities and gather personal information.", choiceC: "Because they can make our computers run faster.", choiceD: "Because they are tasty treats for hackers.", correctAnswerText: 1, is_hardBool: true))

        list.append(Question(questionText: "What is cyberbullying?", choiceA: "Bullying that takes place online or through text messages.", choiceB: "A type of malware that can steal your personal information.", choiceC: "A type of online advertising.", choiceD: "A video game where the final boss is a bully.", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "What is a good way to protect yourself from cyberbullying?", choiceA: "Report bullies and tell a trusted adult.", choiceB: "Write mean comments to cyberbullies.", choiceC: "Never go on the Internet, ever.", choiceD: "Give cyberbullies your personal information.", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "What is one of the best ways to be a good digital citizen?", choiceA: "Be respectful to others online.", choiceB: "Post the first thing that comes to your mind.", choiceC: "Make friends with anyone on social media to increase followers.", choiceD: "Always create long passwords for your accounts.", correctAnswerText: 0, is_hardBool: true))

        /* Hard Phishing Questions */
        list.append(Question(questionText: "What is phishing?", choiceA: "A type of online scam that obtains personal information, such as credit card numbers, by posing as legitimate people or groups of people.", choiceB: "A type of software that is used to protect computers from viruses and malware.", choiceC: "A type of email that is used to advertise products or services.", choiceD: "A type of fishing practiced in the sea.", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "What is a common sign of a phishing email?", choiceA: "The email is from a sender you recognize and know in real life.", choiceB: "The email contains multiple senders instead of one.", choiceC: "The email asks for personal information, such as passwords or credit card numbers.", choiceD: "The email talks about the weather in Antarctica.", correctAnswerText: 2, is_hardBool: true))

        list.append(Question(questionText: "What should you do if you receive a phishing email?", choiceA: "Click on any links in the email.", choiceB: "Open any attachments in the email.", choiceC: "Delete the email without opening it.", choiceD: "Forward the email to all your contacts.", correctAnswerText: 2, is_hardBool: true))

        list.append(Question(questionText: "What is a phishing website?", choiceA: "A website that looks like a real website in order to trick people into entering their personal information.", choiceB: "A website that is used to sell products or services.", choiceC: "A website that is used to advertise products or services.", choiceD: "A website dedicated to fishing tips.", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "What is a common sign of a phishing website?", choiceA: "The website takes a long time to load onto the screen.", choiceB: "The website address looks like a website you’ve seen before, but misspelled.", choiceC: "The website text has big letters.", choiceD: "The website has a picture of a fish as its logo.", correctAnswerText: 1, is_hardBool: true))

        list.append(Question(questionText: "What should you do if you land on a phishing website?", choiceA: "Enter your personal information into any fields on the website.", choiceB: "Close your browser immediately.", choiceC: "Report the website to the authorities.", choiceD: "Click on all the links on the website.", correctAnswerText: 1, is_hardBool: true))

        list.append(Question(questionText: "What is smishing?", choiceA: "A type of phishing that is carried out over text message.", choiceB: "A type of phishing that is carried out over email.", choiceC: "A type of phishing that is carried out over social media.", choiceD: "A type of fishing done in a small pond.", correctAnswerText: 0, is_hardBool: true))
        
        list.append(Question(questionText: "What is one of the best ways to protect yourself from phishing attacks?", choiceA: "Be careful about what links you click on and what attachments you open.", choiceB: "Use strong passwords whenever possible.", choiceC: "Buy the latest model of the computer you’re using.", choiceD: "Share your personal information with anyone who asks for it.", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "You receive an email from someone who appears to be your friend. They tell you that they are in trouble and need money urgently. What should you do?", choiceA: "Reply to the email and offer to send them money.", choiceB: "Delete the email and tell your friend and parents about it.", choiceC: "Ask your parents if it's okay to send your friend money.", choiceD: "Ignore the email and hope it goes away.", correctAnswerText: 1, is_hardBool: true))

        list.append(Question(questionText: "What is the best way to protect yourself from scammer emails?", choiceA: "Open and reply to all emails you receive.", choiceB: "Click on all links in emails, even if you don't know the sender.", choiceC: "Be careful about what emails you open, never click on links in emails from senders you don’t know and trust.", choiceD: "Share your personal information with anyone who asks for it.", correctAnswerText: 2, is_hardBool: true))

        /* Easy Video Game Server Questions */
        
        list.append(Question(questionText: "When you play video games online, should you tell everyone you meet your real name?", choiceA: "Yes, it's okay to share your real name with people you meet online.", choiceB: "No, it's not a good idea to share your real name with people you meet online.", choiceC: "Only share your real name with people you think are your age online.", choiceD: "It's okay to share your real name with people who ask for it.", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "Should you share your personal information, like your address or phone number, with people you meet online while playing video games?", choiceA: "Yes, it's okay to share your personal information with people you meet online.", choiceB: "No, it's not a good idea to share your personal information with people you meet online.", choiceC: "Only share your personal information with people you think are your age online.", choiceD: "It's okay to share your personal information with people who ask for it.", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "Should you accept friend requests from people you don't know while playing video games online?", choiceA: "Yes, it's okay to accept friend requests from anyone you meet online.", choiceB: "No, it's not a good idea to accept friend requests from people you don't know.", choiceC: "Only accept friend requests from people you know in real life.", choiceD: "It's okay to accept friend requests from people who seem nice.", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "Should you click on links that people send you while playing video games online?", choiceA: "Yes, it's okay to click on any link that someone sends you.", choiceB: "No, it's not a good idea to click on links from people you don't know.", choiceC: "Only click on links from people you know in real life.", choiceD: "It's okay to click on links that seem interesting.", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "When you join a public video game server, what is the most important thing to remember?", choiceA: "To win the game at all costs", choiceB: "To be respectful of other players", choiceC: "To talk to everyone you meet", choiceD: "To cheat and use hacks", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do if someone is being mean to you on an online server?", choiceA: "Yell at them and tell them to stop", choiceB: "Ignore them and don't let them get to you", choiceC: "Tell a trusted adult or report the behavior to the server moderators", choiceD: "Try to beat them at the game to show them who's boss", correctAnswerText: 2, is_hardBool: false))

        list.append(Question(questionText: "What should you do if you see someone cheating or using hacks on an online server?", choiceA: "Join them and cheat too", choiceB: "Ignore it and hope they get banned", choiceC: "Report the behavior to the server moderators", choiceD: "Tell them how unfair it is and try to get them kicked from the game.", correctAnswerText: 2, is_hardBool: false))

        list.append(Question(questionText: "What should you do if someone asks you to meet them in person after playing a video game together?", choiceA: "Agree to meet them without telling anyone.", choiceB: "Ask your parents or a trusted adult for permission before meeting them.", choiceC: "Tell them you're not comfortable meeting them and tell a trusted adult.", choiceD: "Tell them you're not sure and will think about it.", correctAnswerText: 2, is_hardBool: false))

        /* Easy Youtube Questions */
        
        list.append(Question(questionText: "While on YouTube, should you share your phone number with people you meet in the comments section?", choiceA: "Yes, it's okay to share your personal information with everyone you meet online.", choiceB: "No, it's not a good idea to share personal information with people you don't know.", choiceC: "Only share your personal information with people you know and trust.", choiceD: "It's okay to share your personal information if someone asks for it nicely.", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "Should you click on links that people post in the comments section of YouTube videos?", choiceA: "Yes, it's okay to click on any link that someone posts.", choiceB: "No, it's not a good idea to click on links from people you don't know.", choiceC: "Only click on links from people you know and trust.", choiceD: "It's okay to click on links that seem interesting or fun.", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "Should you reply to comments from people you don't know on YouTube?", choiceA: "Yes, it's okay to reply to comments from everyone you meet online.", choiceB: "No, it's not a good idea to reply to comments from people you don't know.", choiceC: "Only reply to comments from people you know and trust.", choiceD: "It's okay to reply to comments that seem friendly or interesting.", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do if you see someone being mean to someone else in the comments section of a YouTube video?", choiceA: "Tell the person who is being mean to stop.", choiceB: "Report the behavior to YouTube.", choiceC: "Ignore it and hope it goes away.", choiceD: "Tell the person who is being mean that you understand and are there for them.", correctAnswerText: 1, is_hardBool: false))

        /* Easy Academic Questions */
        list.append(Question(questionText: "Should you click on links that appear on the websites you use when doing homework online?", choiceA: "Yes, it's okay to click on any link that appears on a website.", choiceB: "No, it's not a good idea to click on links from any website.", choiceC: "Only click on links from websites that are recommended by your teacher.", choiceD: "It's okay to click on links that seem interesting or fun.", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "Should you open attachments that people send you in emails while doing homework online?", choiceA: "Yes, it's okay to open any attachment that someone sends you.", choiceB: "No, it's not a good idea to open attachments from people you don't know.", choiceC: "Only open attachments from people you think are your age.", choiceD: "It's okay to open attachments that seem interesting or fun.", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do if you see something strange or inappropriate on a website while doing homework online?", choiceA: "Tell your teacher or a trusted adult about it immediately.", choiceB: "Keep it to yourself and pretend you didn't see anything.", choiceC: "Tell your friends about it and have a laugh about it.", choiceD: "Ignore it and hope it goes away.", correctAnswerText: 0, is_hardBool: false))

        list.append(Question(questionText: "Should you trust all of the information you find on the internet while doing homework?", choiceA: "Yes, you can trust all of the information you find online, even if it comes from unknown sources.", choiceB: "You should always double-check the information you find online with reliable sources like books or encyclopedias.", choiceC: "It's okay to rely on information from websites that have a lot of comments and reviews.", choiceD: "You should only trust information from websites that have a lot of links to other websites.", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do if you are unsure about a website you are using for homework?", choiceA: "Ask your teacher or a trusted adult for help.", choiceB: "Continue using the website even if you have doubts about its accuracy.", choiceC: "Try to find a website with more pictures and less text.", choiceD: "Move on to a different website without further investigation.", correctAnswerText: 0, is_hardBool: false))

        list.append(Question(questionText: "What is the best way to make sure you are using reliable sources for your homework?", choiceA: "Use a variety of sources, including websites, books, and encyclopedias. Try to double-check what you’ve learned with sources that have been recommended by your teacher.", choiceB: "Only use sources that have been recommended by your teacher.", choiceC: "Choose sources that have a lot of advertisements and pop-ups.", choiceD: "Rely on sources that have been shared by your friends on social media.", correctAnswerText: 0, is_hardBool: false))


        
    }
}
