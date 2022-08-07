//
//  ArtworkView.swift
//  Vinyl
//
//  Created by Thomas Gray on 07/08/2022.
//

import SwiftUI

struct ArtworkView: View {
    
    let image: Image?
    var body: some View {
        ZStack {
            if self.image != nil {
                self.image
            } else {
                Color(.systemGray3)
                Image(systemName: "record.circle")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
        .frame(width: 50, height: 50)
        .cornerRadius(10)
        .padding(.trailing, 5)
    }
}

struct ArtworkView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkView(image: nil)
    }
}
