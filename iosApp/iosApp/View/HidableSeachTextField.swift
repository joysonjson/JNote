//
//  HidableSeachTextField.swift
//  iosApp
//
//  Created by Joyson P S on 14/12/22.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI


import SwiftUI

struct HidableSeachTextField<Destination: View>: View {
    
    var onSearchToggled: () -> Void
    var destinationProvider: () -> Destination
    var isSearchActive: Bool
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            if !isSearchActive {
                Text("Todo List")
            }

            TextField("Search...", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .opacity(isSearchActive ? 1 : 0)

            if !isSearchActive {
                Spacer()
            }
            Button(action: onSearchToggled) {
                Image(systemName: isSearchActive ? "xmark" : "magnifyingglass")
                    .foregroundColor(.black)
            }
            NavigationLink(destination: destinationProvider()) {
                Image(systemName: "plus")
                    .foregroundColor(.black)
            }
//            Image(systemName: "plus")
//                .foregroundColor(.black)

//            }
        }
    }
}

struct HidableSeachTextField_Previews: PreviewProvider {
    static var previews: some View {
        HidableSeachTextField(
            onSearchToggled: {},
            destinationProvider: { EmptyView() },
            isSearchActive: true,
            searchText: .constant("YouTube")
        )
    }
}
