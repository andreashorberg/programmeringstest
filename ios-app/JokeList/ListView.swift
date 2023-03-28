//
//  ListView.swift
//  ios-app
//
//  Created by Andreas Hörberg on 2023-03-28.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel = ListViewModel(chuckService: ChuckService())

    var body: some View {
        switch viewModel.viewState {
        case .idle:
            Text("No jokes here yet")
        case .loaded:
            List {
                ForEach(viewModel.jokes) { joke in
                    
                }
            }
        case .error:
            Text("Error :(")
        }
    }

    var addJokeButton: some View {
        Button {

        } label: {
            Text("Joke!")
        }
    }

    func didTapLoadButton() {
        viewModel.didTapLoadButton()
    }
}
