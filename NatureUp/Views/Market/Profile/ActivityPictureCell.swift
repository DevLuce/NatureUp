//
//  ActivityPictureCell.swift
//  NatureUp
//
//  Created by Minyoung Kim on 2022/04/10.
//

import SwiftUI

struct ActivityPictureCell: View {
    
    static let coulmn = 3
    static let row = 7
    let width =
    (UIScreen.main.bounds.width/3)-25
    
    var body: some View {
        Image("img05")
            .resizable()
            .frame(width: 99, height: 99)
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct ActivityPictureCell_Previews: PreviewProvider {
    static var previews: some View {
        ActivityPictureCell()
    }
}