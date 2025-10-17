import SwiftUI

struct ListView: View {
    let viewModel: ListViewModel

    var body: some View {
        List {
            switch viewModel.viewState {
            case .idle:
                Text("No jokes here yet")
            case .loaded, .error:
                if case .error = viewModel.viewState {
                    Section {
                        Text("Error :(")
                    }
                }
                ForEach(viewModel.jokes) { joke in

                }
            }
        }
    }

    var addJokeButton: some View {
        Button {

        } label: {
            Text("Joke!")
        }
    }

    func didTapLoadButton() async {
        await viewModel.didTapLoadButton()
    }
}
