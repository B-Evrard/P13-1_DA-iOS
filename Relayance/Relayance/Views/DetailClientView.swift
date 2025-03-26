//
//  DetailClientView.swift
//  Relayance
//
//  Created by Amandine Cousin on 10/07/2024.
//

import SwiftUI

struct DetailClientView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: RelayanceViewModel
   
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundStyle(.orange)
                .padding(50)
            Spacer()
            Text(viewModel.selectedClient?.nom ?? "")
                .font(.title)
                .padding()
            Text(viewModel.selectedClient?.email ?? "")
                .font(.title3)
            Text(viewModel.selectedClient?.formatDateVersString() ?? "")
                .font(.title3)
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Supprimer") {
                    // suppression
                    self.presentationMode.wrappedValue.dismiss()
                }
                .foregroundStyle(.red)
                .bold()
            }
        }
    }
}

#Preview {
    let selectedClient = Client(
        nom: "Tata",
        email: "tata@email",
        dateCreationString: "20:32 Wed, 30 Oct 2019"
    )
    let viewModel = RelayanceViewModel(selectedClient: selectedClient)
    DetailClientView(viewModel: viewModel)
}
