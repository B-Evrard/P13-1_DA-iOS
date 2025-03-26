//
//  RelayanceViewModel.swift
//  Relayance
//
//  Created by Bruno Evrard on 25/03/2025.
//

import Foundation

class RelayanceViewModel: ObservableObject {
    
    @Published var clientsList: [Client] = []
    
    init() {
        fetchClients()
    }
    
    func fetchClients() {
        clientsList = ModelData.chargement("Source.json")
    }
    
    func addClient(_ client: Client) {
        clientsList.append(client)
        // TODO: Update Json
    }
    
    func deleteClient(client: Client) {
        clientsList.removeAll { $0 == client }
        // TODO: Update Json
    }
    
}
