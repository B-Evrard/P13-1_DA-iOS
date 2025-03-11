//
//  ClientTest.swift
//  RelayanceTests
//
//  Created by Bruno Evrard on 11/03/2025.
//

import XCTest

final class ClientTest: XCTestCase {

    func testInitClient() {
        let dateCreationString = "2025-03-11T09:15:00Z"
        let newClient = Client(nom: "test", email: "test@test.com", dateCreationString: dateCreationString)
        XCTAssertEqual(newClient.nom, "test")
        XCTAssertEqual(newClient.email, "test@test.com")
        XCTAssertEqual(newClient.dateCreation, Date.dateFromString(dateCreationString) ?? Date())
        XCTAssertEqual(newClient.formatDateVersString(), "11-03-2025")
    }
    
    func testCreerNouveauClient() {
        let newClient = Client.creerNouveauClient(nom: "test", email: "test@test.com")
        XCTAssertEqual(newClient.nom, "test")
        XCTAssertEqual(newClient.email, "test@test.com")
        
        
    }
    
    func testEstNouveauClient() {
        let newClient = Client.creerNouveauClient(nom: "test", email: "test@test.com")
        XCTAssertEqual(newClient.nom, "test")
        XCTAssertEqual(newClient.email, "test@test.com")
        XCTAssertTrue(newClient.estNouveauClient())
        
        let dateCreationString = "2025-03-01T09:15:00Z"
        let ancienClient = Client(nom: "test", email: "test@test.com", dateCreationString: dateCreationString)
        XCTAssertFalse(ancienClient.estNouveauClient())
    }
    
    func testClientExiste() {
        
        let client = Client.creerNouveauClient(nom: "test", email: "test@test.com")
        let client2 = Client.creerNouveauClient(nom: "test2", email: "test2@test.com")
        let clientsList = [client]
        
        XCTAssertTrue(client.clientExiste(clientsList: clientsList))
        XCTAssertFalse(client2.clientExiste(clientsList: clientsList))
    }

}
