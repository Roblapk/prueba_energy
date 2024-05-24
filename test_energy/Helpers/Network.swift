//
//  Network.swift
//  test_energy
//
//  Created by Rogelio Bernal on 24/05/24.
//

import Foundation
import Network

class Network: ObservableObject{
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitoring")
    @Published var connected: Bool = false
    
    var connectionDescription: String{
        if connected{
            return "Hay conexión a internet "
        }else{
            return "Parece que no tienes conexión a internet"
        }
    }
    
    init(){
        checkConnection()
    }
    
    func checkConnection() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                if path.status == .satisfied{
                    self?.connected = true
                }else{
                    self?.connected = false
                }
            }
        }
        monitor.start(queue: queue)
    }
    
}
