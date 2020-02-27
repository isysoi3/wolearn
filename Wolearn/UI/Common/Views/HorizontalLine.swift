//
//  HorizontalLine.swift
//  Wolearn
//
//  Created by Ilya Sysoi on 2/27/20.
//  Copyright © 2020 Ilya Sysoi. All rights reserved.
//

import Foundation
import SwiftUI

struct HorizontalLine: View {

    struct HorizontalLineShape: Shape {

        func path(in rect: CGRect) -> Path {

            let fill = CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height)
            var path = Path()
            path.addRoundedRect(in: fill, cornerSize: CGSize(width: 2, height: 2))

            return path
        }
    }

    private var color: Color?
    private var height: CGFloat = 1.0

    init(color: Color, height: CGFloat = 1.0) {
        self.color = color
        self.height = height
    }

    var body: some View {
        HorizontalLineShape()
            .fill(self.color!)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: height, maxHeight: height)
    }
}
