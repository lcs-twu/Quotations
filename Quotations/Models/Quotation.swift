//
//  Quotation.swift
//  Quotations
//
//  Created by Tom Wu on 2023-04-14.
//

import Foundation

struct Quotes: Codable{
    let quoteText: String
    let quoteAuthor: String
    let senderName: String
    let senderLink: String
    let quoteLink: String
}

let exampleQuotes = Quotes(quoteText: "You will not be punished for your anger, you will be punished by your anger.", quoteAuthor: "Buddha", senderName: "", senderLink: "", quoteLink: "http://forismatic.com/en/5885e3dfb6/")

