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
        list.append(Question(questionText: "A stranger asks for your address. What should you do?", choiceA: "Share it with them because they asked nicely", choiceB: "Ignore the request and tell a trusted grown up", choiceC: "Tell them to ask again later", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "How can you protect your online privacy?", choiceA: "Share your password with friends", choiceB: "Keep personal information private",  choiceC: "Accept friend requests from everyone", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do if you see someone being bullied on social media?", choiceA: "Join in and make fun of them", choiceB: "Report the bullying using the Report button", choiceC: "Ignore it and hope it stops", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do if someone you don't know adds you as a friend on social media?", choiceA: "Accept the request immediately", choiceB: "Decline the request and tell a trusted grown up", choiceC: "Ask them why they want to be friends", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do before you post on social media?",  choiceA: "Ask yourself if you would be okay with your parents seeing it.", choiceB: "Just post it without thinking about it.", choiceC: "Ask your followers if it's okay to post it.", correctAnswerText: 0, is_hardBool: false))

        list.append(Question(questionText: "What kind of information should you avoid sharing publicly on social media?", choiceA: "Your favorite food", choiceB: "Your home address", choiceC: "Your favorite book", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What should you do if someone sends you a mean message on social media?", choiceA: "Send an even meaner message back", choiceB: "Ignore it and hope it stops", choiceC: "Report the message and tell a trusted grown up", correctAnswerText: 2, is_hardBool: false))

        list.append(Question(questionText: "What should you do if you accidentally share something online that you didn't mean to?", choiceA: "Pretend it didn't happen and ignore it", choiceB: "Delete the post and tell a trusted grown up", choiceC: "Share even more to distract from the mistake", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "Why is it important to keep your passwords a secret?", choiceA: "So you can share them with your friends", choiceB: "To keep your accounts safe from hackers", choiceC: "So you don't forget them", correctAnswerText: 1, is_hardBool: false))

        list.append(Question(questionText: "What is a social media hacker?", choiceA: "Someone who helps you post",  choiceB: "Someone who steals your social media account", choiceC: "Friends on social media who you don’t like", correctAnswerText: 1, is_hardBool: false))

        /* Hard Social Media Questions */
        list.append(Question(questionText: "Why is it important to ask permission before tagging someone in a photo?", choiceA: "To respect their privacy and feelings", choiceB: "So they feel famous and popular", choiceC: "It's not important; just tag them whenever you want", correctAnswerText: 0, is_hardBool: true))

        list.append(Question(questionText: "What should you do if you think your account has been hacked?", choiceA: "Do nothing and hope it gets better on its own", choiceB: "Change your password immediately and tell a trusted grown up", choiceC: "Delete your account and make a new one with the same name", correctAnswerText: 1, is_hardBool: true))

        list.append(Question(questionText: "What are your social media privacy settings?", choiceA: "Tools to help you get more followers", choiceB: "Controls to help you manage who sees your posts", choiceC: "A timer to stop you from spending too much time online", correctAnswerText: 1, is_hardBool: true))

        list.append(Question(questionText: "Someone you don’t know sent you a message, they want to gift you an Amazon gift card. You:", choiceA: "Always trust the people giving you big prizes for free", choiceB: "Send this person a friend request", choiceC: "Ignore the message and block the user", correctAnswerText: 2, is_hardBool: true))

        list.append(Question(questionText: "How can you protect your location privacy on social media?", choiceA: "Only use location services when absolutely necessary", choiceB: " Share your location with strangers to make new friends", choiceC: "Post about where you’re going", correctAnswerText: 0, is_hardBool: true))
        
        list.append(Question(questionText: "How can you protect yourself from identity theft on social media?", choiceA: "Share your  personal information with everyone", choiceB: "Regularly update your profile with new information", choiceC: "Only use strong passwords", correctAnswerText: 2, is_hardBool: true))

        /* Easy User Privacy Questions */
        list.append(Question(questionText: "What is online privacy?",
                             choiceA: "Sharing personal information with everyone",
                             choiceB: "Keeping personal information to yourself",
                             choiceC: "Deleting all social media accounts",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "Why is it important to protect your privacy online?",
                             choiceA: "To make friends",
                             choiceB: "To share information with strangers",
                             choiceC: "To stop hackers from stealing your information",
                             correctAnswerText: 2,
                             is_hardBool: false))

        list.append(Question(questionText: "Which of the following is considered personal information?",
                             choiceA: "Your birthdate",
                             choiceB: "The name of your favorite restaurant",
                             choiceC: "The title of the last book you read",
                             correctAnswerText: 0,
                             is_hardBool: false))

        list.append(Question(questionText: "Why should you be careful about sharing your location online?",
                             choiceA: "Because it can help strangers find out where you are",
                             choiceB: "Because it can make you popular",
                             choiceC: "Because it makes it easier to meet new friends",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "How can you stop sharing your location on social media?",
                             choiceA: "Go to your account settings and turn off the location option",
                             choiceB: "Tell your friends where you are",
                             choiceC: "Keep posting updates about your location",
                             correctAnswerText: 0,
                             is_hardBool: false))

        list.append(Question(questionText: "What does sharing your location do?",
                             choiceA: "It means telling your friends what you ate for lunch",
                             choiceB: "It means letting everyone know where you are, like a park or a restaurant",
                             choiceC: "It means changing your profile picture",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "When might you want to turn on location services for some time?",
                             choiceA: "When you're lost and need directions",
                             choiceB: "When you want to keep your location private",
                             choiceC: "When you want to share your location with friends all the time",
                             correctAnswerText: 0,
                             is_hardBool: false))

        list.append(Question(questionText: "What should you do if a stranger asks for your location online?",
                             choiceA: "Ignore the request and tell a trusted grown-up",
                             choiceB: "Immediately share your location to be helpful",
                             choiceC: "Ask them why they need your location",
                             correctAnswerText: 0,
                             is_hardBool: false))

        /* Digital Footprint Hard Questions */
        list.append(Question(questionText: "What is a digital footprint?",
                             choiceA: "Everything you do on the Internet publicly",
                             choiceB: "The amount of time you spend on the internet each day.",
                             choiceC: "The number of friends you have on social media.",
                             correctAnswerText: 0,
                             is_hardBool: true))

        list.append(Question(questionText: "What can add to your digital footprint?",
                             choiceA: "The websites you visit, the emails you send, and the posts you make on social media.",
                             choiceB: "The computer model you have.",
                             choiceC: "Your passwords for TikTok and Instagram.",
                             correctAnswerText: 0,
                             is_hardBool: true))

        list.append(Question(questionText: "Why is it important to know your digital footprint?",
                             choiceA: "Because it can affect your reputation and privacy.",
                             choiceB: "Because it can be used to hack into your social media accounts.",
                             choiceC: "Because it is sent to your parents as a letter every month.",
                             correctAnswerText: 0,
                             is_hardBool: true))

        list.append(Question(questionText: "What are some ways to protect your digital footprint?",
                             choiceA: "Keep your software up to date.",
                             choiceB: "Always buy the latest model of the computer brand you’re using.",
                             choiceC: "Be careful about what information you share online.",
                             correctAnswerText: 2,
                             is_hardBool: true))

        list.append(Question(questionText: "What is a cookie?",
                             choiceA: "A small piece of data that a website stores on your computer when you visit the site.",
                             choiceB: "A type of hacking to steal your personal information.",
                             choiceC: "A type of online advertising.",
                             correctAnswerText: 0,
                             is_hardBool: true))

        list.append(Question(questionText: "Why should we be careful with cookies?",
                             choiceA: "Because they can be easily eaten by mistake.",
                             choiceB: "Because they can track our online activities and gather personal information.",
                             choiceC: "Because they can make our computers run faster.",
                             correctAnswerText: 1,
                             is_hardBool: true))

        list.append(Question(questionText: "What is cyberbullying?",
                             choiceA: "Bullying that takes place online or through text messages.",
                             choiceB: "A type of malware that can steal your personal information.",
                             choiceC: "A type of online advertising.",
                             correctAnswerText: 0,
                             is_hardBool: true))

        list.append(Question(questionText: "What is a good way to protect yourself from cyberbullying?",
                             choiceA: "Report bullies and tell a trusted grown-up.",
                             choiceB: "Write mean comments to cyberbullies.",
                             choiceC: "Never go on the Internet, ever.",
                             correctAnswerText: 0,
                             is_hardBool: true))

        list.append(Question(questionText: "What is one of the best ways to be a good digital citizen?",
                             choiceA: "Be respectful to others online.",
                             choiceB: "Post the first thing that comes to your mind.",
                             choiceC: "Make friends with anyone on social media to increase followers.",
                             correctAnswerText: 0,
                             is_hardBool: true))


        /* Hard Phishing Questions */
        list.append(Question(questionText: "What is phishing?",
                             choiceA: "A type of online scam that obtains personal information, such as credit card numbers, by posing as legitimate people or groups of people.",
                             choiceB: "A type of software that is used to protect computers from viruses and malware.",
                             choiceC: "A type of email that is used to advertise products or services.",
                             correctAnswerText: 0,
                             is_hardBool: true))

        list.append(Question(questionText: "What is a common sign of a phishing email?",
                             choiceA: "The email is from a sender you recognize and know in real life.",
                             choiceB: "The email contains multiple senders instead of one.",
                             choiceC: "The email asks for personal information, such as passwords or credit card numbers.",
                             correctAnswerText: 2,
                             is_hardBool: true))

        list.append(Question(questionText: "What should you do if you receive a phishing email?",
                             choiceA: "Click on any links in the email.",
                             choiceB: "Open any attachments in the email.",
                             choiceC: "Delete the email without opening it.",
                             correctAnswerText: 2,
                             is_hardBool: true))

        list.append(Question(questionText: "What is a phishing website?",
                             choiceA: "A website that looks like a real website in order to trick people into entering their personal information.",
                             choiceB: "A website that is used to sell products or services.",
                             choiceC: "A website that is used to advertise products or services.",
                             correctAnswerText: 0,
                             is_hardBool: true))

        list.append(Question(questionText: "What is a common sign of a phishing website?",
                             choiceA: "The website takes a long time to load onto the screen.",
                             choiceB: "The website address looks like a website you’ve seen before, but misspelled.",
                             choiceC: "The website text has big letters.",
                             correctAnswerText: 1,
                             is_hardBool: true))

        list.append(Question(questionText: "What should you do if you land on a phishing website?",
                             choiceA: "Enter your personal information into any fields on the website.",
                             choiceB: "Close your browser immediately.",
                             choiceC: "Report the website to the authorities.",
                             correctAnswerText: 1,
                             is_hardBool: true))

        list.append(Question(questionText: "What is smishing?",
                             choiceA: "A type of phishing that is carried out over text message.",
                             choiceB: "A type of phishing that is carried out over email.",
                             choiceC: "A type of phishing that is carried out over social media.",
                             correctAnswerText: 0,
                             is_hardBool: true))

        list.append(Question(questionText: "What is one of the best ways to protect yourself from phishing attacks?",
                             choiceA: "Be careful about what links you click on and what attachments you open.",
                             choiceB: "Use strong passwords whenever possible.",
                             choiceC: "Buy the latest model of the computer you’re using.",
                             correctAnswerText: 0,
                             is_hardBool: true))

        list.append(Question(questionText: "You receive an email from someone who appears to be your friend. They tell you that they are in trouble and need money urgently. What should you do?",
                             choiceA: "Reply to the email and offer to send them money.",
                             choiceB: "Delete the email and tell your friend and parents about it.",
                             choiceC: "Ask your parents if it's okay to send your friend money.",
                             correctAnswerText: 1,
                             is_hardBool: true))

        list.append(Question(questionText: "What is the best way to protect yourself from scammer emails?",
                             choiceA: "Open and reply to all emails you receive.",
                             choiceB: "Click on all links in emails, even if you don't know the sender.",
                             choiceC: "Be careful about what emails you open, never click on links in emails from senders you don’t know and trust.",
                             correctAnswerText: 2,
                             is_hardBool: true))


        /* Easy Video Game Server Questions */
        
        list.append(Question(questionText: "When you play video games online, should you tell everyone you meet your real name?",
                             choiceA: "Yes, it's okay to share your real name with people you meet online.",
                             choiceB: "No, it's not a good idea to share your real name with people you meet online.",
                             choiceC: "Only share your real name with people you think are your age online.",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "Should you share your personal information, like your address or phone number, with people you meet online while playing video games?",
                             choiceA: "Yes, it's okay to share your personal information with people you meet online.",
                             choiceB: "No, it's not a good idea to share your personal information with people you meet online.",
                             choiceC: "Only share your personal information with people you think are your age online.",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "Should you accept friend requests from people you don't know while playing video games online?",
                             choiceA: "Yes, it's okay to accept friend requests from anyone you meet online.",
                             choiceB: "No, it's not a good idea to accept friend requests from people you don't know.",
                             choiceC: "Only accept friend requests from people you know in real life.",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "Should you click on links that people send you while playing video games online?",
                             choiceA: "Yes, it's okay to click on any link that someone sends you.",
                             choiceB: "No, it's not a good idea to click on links from people you don't know.",
                             choiceC: "Only click on links from people you know in real life.",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "When you join a public video game server, what is the most important thing to remember?",
                             choiceA: "To win the game at all costs",
                             choiceB: "To be respectful of other players",
                             choiceC: "To talk to everyone you meet",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "What should you do if someone is being mean to you on an online server?",
                             choiceA: "Yell at them and tell them to stop",
                             choiceB: "Ignore them and don't let them get to you",
                             choiceC: "Tell a trusted grown up or report the behavior to the server moderators",
                             correctAnswerText: 2,
                             is_hardBool: false))

        list.append(Question(questionText: "What should you do if you see someone cheating or using hacks on an online server?",
                             choiceA: "Join them and cheat too",
                             choiceB: "Ignore it and hope they get banned",
                             choiceC: "Report the behavior to the server moderators",
                             correctAnswerText: 2,
                             is_hardBool: false))

        list.append(Question(questionText: "What should you do if someone asks you to meet them in person after playing a video game together?",
                             choiceA: "Agree to meet them without telling anyone.",
                             choiceB: "Ask your parents or a trusted grown up for permission before meeting them.",
                             choiceC: "Tell them you're not comfortable meeting them and tell a trusted grown up.",
                             correctAnswerText: 2,
                             is_hardBool: false))

        /* Easy Youtube Questions */
        
        list.append(Question(questionText: "While on YouTube, should you share your phone number with people you meet in the comments section?",
                             choiceA: "Yes, it's okay to share your personal information with everyone you meet online.",
                             choiceB: "No, it's not a good idea to share personal information with people you don't know.",
                             choiceC: "Only share your personal information with people you know and trust.",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "Should you click on links that people post in the comments section of YouTube videos?",
                             choiceA: "Yes, it's okay to click on any link that someone posts.",
                             choiceB: "No, it's not a good idea to click on links from people you don't know.",
                             choiceC: "Only click on links from people you know and trust.",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "Should you reply to comments from people you don't know on YouTube?",
                             choiceA: "Yes, it's okay to reply to comments from everyone you meet online.",
                             choiceB: "No, it's not a good idea to reply to comments from people you don't know.",
                             choiceC: "Only reply to comments from people you know and trust.",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "What should you do if you see someone being mean to someone else in the comments section of a YouTube video?",
                             choiceA: "Tell the person who is being mean to stop.",
                             choiceB: "Report the behavior to YouTube.",
                             choiceC: "Ignore it and hope it goes away.",
                             correctAnswerText: 1,
                             is_hardBool: false))

        /* Easy Academic Questions */
        list.append(Question(questionText: "Should you click on links that appear on the websites you use when doing homework online?",
                             choiceA: "Yes, it's okay to click on any link that appears on a website.",
                             choiceB: "No, it's not a good idea to click on links from any website.",
                             choiceC: "Only click on links from websites that are recommended by your teacher.",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "Should you open attachments that people send you in emails while doing homework online?",
                             choiceA: "Yes, it's okay to open any attachment that someone sends you.",
                             choiceB: "No, it's not a good idea to open attachments from people you don't know.",
                             choiceC: "Only open attachments from people you think are your age.",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "What should you do if you see something strange or inappropriate on a website while doing homework online?",
                             choiceA: "Tell your teacher or a trusted grown up about it immediately.",
                             choiceB: "Keep it to yourself and pretend you didn't see anything.",
                             choiceC: "Tell your friends about it and have a laugh about it.",
                             correctAnswerText: 0,
                             is_hardBool: false))

        list.append(Question(questionText: "Should you trust all of the information you find on the internet while doing homework?",
                             choiceA: "Yes, you can trust all of the information you find online, even if it comes from unknown sources.",
                             choiceB: "You should always double-check the information you find online with reliable sources like books or encyclopedias.",
                             choiceC: "It's okay to rely on information from websites that have a lot of comments and reviews.",
                             correctAnswerText: 1,
                             is_hardBool: false))

        list.append(Question(questionText: "What should you do if you are unsure about a website you are using for homework?",
                             choiceA: "Ask your teacher or a trusted grown up for help.",
                             choiceB: "Continue using the website even if you have doubts about its accuracy.",
                             choiceC: "Try to find a website with more pictures and less text.",
                             correctAnswerText: 0,
                             is_hardBool: false))

        list.append(Question(questionText: "What is the best way to make sure you are using reliable sources for your homework?",
                             choiceA: "Use a variety of sources, including websites, books, and encyclopedias. Try to double-check what you’ve learned with sources that have been recommended by your teacher.",
                             choiceB: "Only use sources that have been recommended by your teacher.",
                             choiceC: "Choose sources that have a lot of advertisements and pop-ups.",
                             correctAnswerText: 0,
                             is_hardBool: false))
        
    }
}
