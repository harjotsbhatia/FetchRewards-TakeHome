//
//  File.swift
//  FetchRewards
//
//  Created by Harjot Bhatia on 2/2/24.
//

import SwiftUI

struct DessertsView: View {
    @StateObject var viewModel = ViewModel()
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.desserts, id: \.self) { recipe in
                        NavigationLink(destination: DessertDetailView(viewModel: .init(dessert: recipe))) {
                            DessertGridItem(dessert: recipe)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Desserts")
            .task {
                await viewModel.fetchDesserts()
            }
        }
    }
}

struct DessertGridItem: View {
    let dessert: Dessert

    var body: some View {
        VStack {
            AsyncImage(url: dessert.thumb) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)
            .background(Color.gray)
            .clipShape(Circle())

            Text(dessert.name)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
        }
        .padding(.bottom)
    }
}

struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertsView()
    }
}

