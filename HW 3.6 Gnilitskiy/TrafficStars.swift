//
//  TrafficStars.swift
//  HW 3.6 Gnilitskiy
//
//  Created by Александр on 24.09.2022.
//

import SwiftUI

struct TrafficStars: View {
    
    private var size = 5.0
    
    
    var body: some View {
        
        HStack {
            MoveStar()
                .frame(width: size, height: 100)
            
            VStack {
                MoveStar()
                    .frame(width: size, height: 100)
                Spacer()
                MoveStar()
                    .frame(width: size, height: 100)
            }
            
            VStack {
                MoveStar()
                    .frame(width: size, height: 100)
            }
            .padding(30)
            Spacer()
            VStack {
                Spacer()
                MoveStar()
                    .frame(width: size, height: 100)
            }
            .padding(50)
            
            
            Spacer()
            
            MoveStar()
                .frame(width: size, height: 100)
            
            VStack {
                MoveStar()
                    .frame(width: size, height: 100)
                Spacer()
                MoveStar()
                    .frame(width: size, height: 100)
            }
            VStack {
                MoveStar()
                    .frame(width: size, height: 100)
            }
        }
        .padding(60)
        
        
    }
}

struct TrafficStars_Previews: PreviewProvider {
    static var previews: some View {
        TrafficStars()
    }
}
