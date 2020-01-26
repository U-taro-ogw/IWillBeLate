//
//  MenuView.swift
//  IWillBeLate WatchKit Extension
//
//  Created by U-taro on 2020/01/26.
//  Copyright © 2020 U-taro. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        List {
            NavigationLink(destination: SendDelayView()) {
                Text("遅刻します").font(.subheadline)
            }
        }
        .listStyle(CarouselListStyle())
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
