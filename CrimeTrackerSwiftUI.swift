//
//  CrimeTrackerSwiftUI.swift
//  Crime Tracker
//
//  Created by user on 8/10/19.
//  Copyright © 2019 Alphonso. All rights reserved.
//

import SwiftUI
import UIKit

struct CrimeTrackerSwiftUI: View {
    @State private var cityIndex = 0
    
    var body: some View {

        VStack {
            VStack {
                Image("Icon").resizable().frame(width: 222.00, height: 222.00, alignment: .leading)
                Text("Select A City")
               
            Section {
                Picker(selection: $cityIndex, label: Text(""))
                           {
                               Text("Oakland").tag(1)
                               Text("Fremont").tag(2)
                               Text("Hayward").tag(3)
                               Text("Berkeley").tag(4)
                                   
                }
                .padding(110.0)
                .frame(width: 400.00, height: 200.00, alignment: .center)
                       }
            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Get Crime Results")
                .foregroundColor(.black)
                    
            } .foregroundColor(.gray)
        }
    }
}

#if DEBUG
struct CrimeTrackerSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        CrimeTrackerSwiftUI()
    }
}
#endif
