//
//  MoveStar.swift
//  HW 3.6 Gnilitskiy
//
//  Created by Александр on 24.09.2022.
//

import SwiftUI

struct MoveStar: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            let size = min(width, height)
            
            let middle = size / 2
            
            Path { path in
                
                path.addRoundedRect(in: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: width, height: height)), cornerSize: CGSize(width: middle, height: middle))
                
            }
            .fill(Color(red: 1, green: 1, blue: 0))
        }
    }
}

struct MoveStar_Previews: PreviewProvider {
    static var previews: some View {
        MoveStar()
    }
}
