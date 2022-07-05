//
//  HomeView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var shouldShowForm: Bool = false
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .bottom) {
                DinosaurListView()
                
                NavigationLink(
                  destination: DinosaurStatsView(),
                  isActive: $shouldShowForm ){}
                
                HStack {
                    Spacer()
                    Button {
                        shouldShowForm = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .padding()
                    }

                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
