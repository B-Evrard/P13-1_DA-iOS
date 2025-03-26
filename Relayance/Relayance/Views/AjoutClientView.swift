//
//  AjoutClientView.swift
//  Relayance
//
//  Created by Amandine Cousin on 10/07/2024.
//

import SwiftUI

struct AjoutClientView: View {
    @ObservedObject var viewModel: RelayanceViewModel
    @Binding var dismissModal: Bool
    @State var nom: String = ""
    @State var email: String = ""
    
    var body: some View {
        VStack {
            Text("Ajouter un nouveau client")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            Spacer()
            TextField("Nom", text: $nom)
                .font(.title2)
            TextField("Email", text: $email)
                .font(.title2)
            Button("Ajouter") {
                viewModel.addClient(nom: nom, email: email)
                if (!viewModel.showAlert)
                {
                    dismissModal.toggle()
                }
                
            }
            .padding(.horizontal, 50)
            .padding(.vertical)
            .font(.title2)
            .bold()
            .background(RoundedRectangle(cornerRadius: 10).fill(.orange))
            .foregroundStyle(.white)
            .padding(.top, 50)
            Spacer()
            Text(viewModel.messageAlert)
                .transition(.move(edge: .top))
                .foregroundColor(.red)
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    let viewModel = RelayanceViewModel()
    AjoutClientView(viewModel: viewModel, dismissModal: .constant(false))
}
