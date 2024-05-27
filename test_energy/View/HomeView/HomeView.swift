//
//  ContentView.swift
//  test_energy
//
//  Created by Rogelio Bernal on 24/05/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var allViewModel = AllViewModel()
    @EnvironmentObject var network: Network
    @State private var showNetworkAlert = false
    
    var body: some View {
        NavigationView{
           List{
                Section(header: Text("Lista")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .font(.subheadline)){
                        if !allViewModel.isLoading{
                            ForEach(allViewModel.allList, id: \.self) { all in
                                AllCellView(all: all)
                            }
                        }else{
                            ProgressView("Cargando...")
                        }
                    }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("TODOS")
        }.task {
            allViewModel.getAllList()
        }.onChange(of: network.connected){ result in
            showNetworkAlert = result == false
        }.alert(network.connectionDescription, isPresented: $showNetworkAlert){}
    }
}

/*struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}*/
