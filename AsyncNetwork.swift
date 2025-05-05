//
//  ContentView.swift
//  StravaPractice
//
//  Created by Gal Cohavy on 5/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var user: GithubUser?
    
    var body: some View {
        VStack (spacing: 10){
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
            }
            
             Text(user?.login ?? "no username")
                .font(.headline)
            Text(user?.bio ?? "no bio yet.")
                .fontWeight(.light)
        }
        .padding()
        .task {
            do {
                user = try await getUser()
            } catch GHError.invalidURL{
                print("invalid URL")
            } catch GHError.invalidData {
                print("invalid data")
            } catch GHError.invalidResponse {
                print("invalid response ")
            } catch {
                print("unexpected error")
            }
        }
    }
    
    func getUser() async throws -> GithubUser {
        let endpoint = "https://api.github.com/users/jonathanlevi"
        guard let url = URL(string: endpoint) else {
            throw GHError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GithubUser.self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct GithubUser: Codable {
    let login: String
    let avatarUrl: String
    let bio: String
}

enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
