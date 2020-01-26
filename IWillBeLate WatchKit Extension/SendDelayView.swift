//
//  SendDelayView.swift
//  IWillBeLate WatchKit Extension
//
//  Created by U-taro on 2020/01/26.
//  Copyright © 2020 U-taro. All rights reserved.
//

import SwiftUI

struct SendDelayView: View {
    
    @ObservedObject var postSlack = PostSlack()
    
    var body: some View {
        Button(action: {
            self.postSlack.post()
        }) {
            Text("遅刻連絡")
        }
        .alert(isPresented: $postSlack.isShowDialog) { () -> Alert in
            Alert(title: Text(postSlack.isSuccess ? "Success": "Failure"),
                  message: Text(postSlack.message),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct SendDelayView_Previews: PreviewProvider {
    static var previews: some View {
        SendDelayView()
    }
}
