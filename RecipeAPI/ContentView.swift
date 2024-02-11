//
//  ContentView.swift
//  RecipeAPI
//
//  Created by noor alotibi on 01/08/1445 AH.
//




import SwiftUI

struct ContentView: View {
    
    @State private var recipeName: String = ""
    let recipeClient = RecipeClient()
    @State private var recipes: [Recipe] = []
    
    var body: some View {
        VStack {
            Text("Search for any recipe😋🍽️")
                .padding(.trailing,120)
                .font(.title2)
                .fontDesign(.rounded)

            TextField("Enter name of recipe ", text: $recipeName)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(.black)
                .onSubmit {
                    Task {
                        do {
                            recipes = try await recipeClient.searchRecipe(recipeName)
                        } catch {
                            print(error)
                        }
                    }
                }.padding()
            
            List(recipes) { recipe in
                HStack {
                    AsyncImage(url: recipe.featuredImage) { image in
                        image.resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 23, style: .circular))
                            .frame(width: 80, height: 80)
                    } placeholder: {
                        ProgressView("Loading")
                    }

                    Text(recipe.title)
                        .foregroundStyle(.blue)
                }
            } .scrollContentBackground(.hidden)
                .background(Color.white.edgesIgnoringSafeArea(.all))
        }
       
    }
}


#Preview {
    ContentView()
}
