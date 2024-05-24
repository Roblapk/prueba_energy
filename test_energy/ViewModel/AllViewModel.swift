//
//  AllViewModel.swift
//  test_energy
//
//  Created by Rogelio Bernal on 24/05/24.
//

import Foundation
import Combine

class AllViewModel: ObservableObject{
    
    @Published var allList = [AllModel]()
    @Published var isLoading = true
    
    //instance
    private let apiService: APIServiceProtocol
    
    init(apiService: APIServiceProtocol = APIService()){
        self.apiService = apiService
    }
    
    func getAllList() {
        apiService.getAll { [weak self] result in
            DispatchQueue.main.async {
                switch result{
                    case .success(let allList):
                        self?.allList = allList
                    print("allList: \(allList)")
                        self?.isLoading = false
                    case .failure(let error):
                    print("Hubo un error: \(error.localizedDescription)")
                }
            }
        }
    }
    
}
