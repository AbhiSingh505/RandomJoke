//
//  ContentView.swift
//  randomjoke
//
//  Created by Abhishek Singh Chouhan on 15/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var jokes:[Joke]=[]
    var body: some View {
        NavigationStack{
            
            VStack {
                List{
                    
                    ForEach(jokes) { joke in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(joke.setup)
                                .fontWeight(.bold)
                            Text(joke.punchline).foregroundColor(.gray)
                        }
                    }
                }
                
            }
            .navigationTitle(("Jokes"))
            .toolbar{
                Button("refresh"){
                    Task{
                        do{
                            try await fetchdata()
                        }catch{
                            print("errorr: \(error)")
                        }
                    }
             
            }
            }
        }
    }
    @MainActor
    func fetchdata()async throws{
        guard  let url = URL(string:"https://official-joke-api.appspot.com/random_ten") else{
            throw err.invalidurl
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = try JSONDecoder().decode([Joke].self,from:data)
        jokes=decoder
    }
}

#Preview {
    ContentView()
}
