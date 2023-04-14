//
//  QuotesView.swift
//  Quotations
//
//  Created by Tom Wu on 2023-04-14.
//

import SwiftUI

struct QuotesView: View {
    
    @State var punchlineOpacity = 0.0
    
    @State var currentQuote: Quotes?
    
    var body: some View {
        NavigationView{
            VStack{
                
                Spacer()
                
                if let currentQuote = currentQuote{
                    Text(currentQuote.quoteText)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        withAnimation(.easeIn(duration: 1.0)){
                            punchlineOpacity = 1.0
                        }
                    }, label: {Image(systemName: "arrow.down.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .tint(.black)
                    })
                    
                    Text(currentQuote.quoteAuthor)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .opacity(punchlineOpacity)
                    
                    Text(currentQuote.senderName)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .opacity(punchlineOpacity)
                }else{
                    ProgressView()
                }
                
                Spacer()
                
                Button(action: {
                                     // Reset the interface
                                     punchlineOpacity = 0.0

                                     Task {
                                         // Get another joke
                                         withAnimation {
                                             currentQuote = nil
                                         }
                                         currentQuote = await NetworkService.fetch()
                                     }
                                 }, label: {
                                     Text("Fetch another one")
                                 })
                                 .disabled(punchlineOpacity == 0.0 ? true : false)
                                 .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Random Quotes")
        }
        .task {
            currentQuote = await NetworkService.fetch()
        }
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
    }
}
