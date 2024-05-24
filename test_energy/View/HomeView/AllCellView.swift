//
//  AllListCellView.swift
//  test_energy
//
//  Created by Rogelio Bernal on 24/05/24.
//

import SwiftUI

struct AllCellView: View {
    
    var all : AllModel

    var body: some View {
        HStack{
            Image("spaceship")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(.vertical, 5)
                .padding(.horizontal, 5)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(all.title)")
                    .fontWeight(.semibold)
                    .font(.title2)
                    .minimumScaleFactor(0.5)
                Text("User ID: \(all.userId)")
                    .font(.subheadline)
                Text("ID: \(all.id)")
                    .font(.subheadline)
                Text("Completed: \(all.completed ? "True" : "False")")
                    .font(.subheadline)
            }
        }
    }
}

/*struct AllCellView_Previews: PreviewProvider {
    static var previews: some View {
        AllCellView()
    }
}*/
