//
//  RelayanceViewModel.swift
//  Relayance
//
//  Created by Bruno Evrard on 25/03/2025.
//

import Foundation

class RelayanceViewModel: ObservableObject {
    
    @Published var clientsList: [Client] = []
    @Published var selectedClient: Client?
    
    init() {
        fetchClients()
    }
    
    init (selectedClient: Client) {
        self.selectedClient = selectedClient
    }
    
    func fetchClients() {
        clientsList = ModelData.chargement("Source.json")
    }
    
}
