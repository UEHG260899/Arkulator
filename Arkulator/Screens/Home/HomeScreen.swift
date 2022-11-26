//
//  HomeView.swift
//  Arkulator
//
//  Created by Uriel Hernandez Gonzalez on 04/07/22.
//

import SwiftUI
import RealmSwift

struct HomeScreen: View {
    
    @StateObject private var viewModel = HomeScreenViewModel()
    @State var shouldShowForm: Bool = false
    
    init() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .bottom) {
                DinosaurListView(viewModel: viewModel)
                
                NavigationLink(
                  destination: DinosaurStatsScreen(),
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
        HomeScreen()
    }
}
