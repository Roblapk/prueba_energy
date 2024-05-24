//
//  test_energyApp.swift
//  test_energy
//
//  Created by Rogelio Bernal on 24/05/24.
//

import SwiftUI

@main
struct test_energyApp: App {
    
    @State private var isLaunchViewPresented = true
    @StateObject var network = Network()
    
    var body: some Scene {
        WindowGroup {
            
            if !isLaunchViewPresented{
                HomeView()
                /*if let _ = authViewModel.emailUser{
                    HomeView(authViewModel: authViewModel)
                        .preferredColorScheme(.light)
                        .environmentObject(network)
                }else{
                    AuthenticationView(authViewModel: authViewModel)
                        .preferredColorScheme(.light)
                        .environmentObject(network)
                }*/
            }else{
                LaunchView(ispresented: $isLaunchViewPresented)
            }
        }
    }
}
