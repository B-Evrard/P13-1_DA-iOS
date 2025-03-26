//
//  RelayanceViewModel.swift
//  Relayance
//
//  Created by Bruno Evrard on 25/03/2025.
//

import Foundation

class RelayanceViewModel: ObservableObject {
    
    @Published var clientsList: [Client] = []
    
    @Published var showAlert: Bool = false
    @Published var messageAlert: String = ""{
        didSet {
            if messageAlert.isEmpty {
                showAlert = false
            }
            else {
                showAlert = true
            }
        }
    }
    
    var sourceJson: String = "Source.json"
    var bundle: Bundle = .main
    
    init() {
        fetchClients()
    }
    
    init (sourceJson: String, bundle: Bundle) {
        self.sourceJson = sourceJson
        self.bundle = bundle
        fetchClients()
    }
    
    func fetchClients() {
        clientsList = ModelData.chargement(sourceJson,bundle: bundle)
    }
    
    func addClient(nom: String, email: String) {
        messageAlert = ""
        if (nom.isEmpty) {
            messageAlert = "Le nom est requis."
            return
        }
        
        messageAlert = validateEmail(email)
        
        if (messageAlert.isEmpty) {
            let client = Client.creerNouveauClient(nom: nom, email: email)
            clientsList.append(client)
            // TODO: Update Json
        }
    }
    
    func deleteClient(client: Client) {
        clientsList.removeAll { $0 == client }
        // TODO: Update Json
    }
    
    private func validateEmail(_ email: String) -> String {
        if (email.isEmpty) {
            return "L'email est requis."
        }
        
        let emailRegex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        
        guard emailPredicate.evaluate(with: email) else {
            return "L'email est invalide."
        }
        
        return ""
    }
    
}
