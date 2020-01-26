//
//  PostSlack.swift
//  IWillBeLate WatchKit Extension
//
//  Created by U-taro on 2020/01/26.
//  Copyright © 2020 U-taro. All rights reserved.
//

import Foundation

class PostSlack: ObservableObject {
    
    @Published var isShowDialog = false
    @Published var isSuccess = false
    @Published var message = ""
    
    func post() {
        // TODO 発行したURL *画面から登録できるようにしないといけない。
        let url = ""
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        var postParams = Dictionary<String, String>()
        postParams["text"] = "遅刻します"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: postParams, options: [])
        } catch {
            self.isShowDialog = true
            self.isSuccess = false
            self.message = error.localizedDescription
        }
        
        let task = URLSession.shared.dataTask(with: request)
        { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                self.isShowDialog = true
                self.isSuccess = false
                self.message = error.localizedDescription
                return
            }
            guard let _ = data, let response = response as? HTTPURLResponse else {
                self.isShowDialog = true
                self.isSuccess = false
                self.message = "No data or No response."
                return
            }
            if response.statusCode == 200 {
                self.isShowDialog = true
                self.isSuccess = true
                self.message = "Posted CHIKOKU"
            } else {
                self.isShowDialog = true
                self.isSuccess = false
                self.message = "Status Code: " + String(response.statusCode)
            }
        }
        task.resume()
    }
    
}
