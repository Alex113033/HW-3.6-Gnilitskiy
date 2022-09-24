//
//  RocketElement.swift
//  HW 3.6 Gnilitskiy
//
//  Created by Александр on 23.09.2022.
//

import SwiftUI

struct RocketElement: View {
    var body: some View {
        
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height

            let size = min(width, height)

            let nearLine = size * 0.4
            let farLine = size * 0.6
            let middle = size / 2


            Path { path in

                path.move(to: CGPoint(x: nearLine, y: farLine))

                path.addQuadCurve(
                    to: CGPoint(x: farLine, y: farLine),
                    control: CGPoint(x: middle, y: nearLine - 150)
                )

                path.addLine(to: CGPoint(x: farLine + 10, y: farLine + 10))
                
                path.addLine(to: CGPoint(x: farLine + 10, y: nearLine + 80))

                path.addLine(to: CGPoint(x: middle + 10, y: nearLine + 60))
                
                path.addLine(to: CGPoint(x: middle - 10, y: nearLine + 60))
                
                
                path.addLine(to: CGPoint(x: nearLine - 10, y: nearLine + 80))
                
                path.addLine(to: CGPoint(x: nearLine - 10, y: farLine + 10))
            }
            .fill(Color(red: 0.3, green: 0.35, blue: 0.4))
            
            Path { path in
           
                path.addEllipse(in: CGRect(
                    origin: CGPoint(x: middle, y: middle),
                    size: CGSize(width: 10, height: 10)
                ))
                path.addEllipse(in: CGRect(
                    origin: CGPoint(x: middle, y: middle + 15),
                    size: CGSize(width: 10, height: 10)
                ))
            }
            .fill(Color.white)
           
        }
        
    }
}

struct RocketElement_Previews: PreviewProvider {
    static var previews: some View {
        RocketElement()
            .frame(width: 200, height: 200)
    }
}
