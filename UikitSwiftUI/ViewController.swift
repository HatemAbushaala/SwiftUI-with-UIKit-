//
//  ViewController.swift
//  UikitSwiftUI
//
//  Created by Hatem Abushaala on 1/20/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let page = UIHostingController(rootView:Page(cb: { (String) in
            print("string is \(String)")
            self.dismiss(animated: true, completion: nil)
        }) )
   
        //navigationController?.pushViewController(page, animated: true)
        present(page, animated: true, completion: nil)
    }


}

class ViewController2: UIViewController {
    var onResult : ((String)->Void)? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.onResult?("data from view controller received")
        }
    }
}

// bridge between uikit view controller and swift ui view
struct VC2View : UIViewControllerRepresentable {
    var onResult : ((String)->Void)? = nil

    func makeUIViewController(context: Context) -> ViewController2 {
        let vc = ViewController2()
        vc.onResult = { string in
            // do something
            self.onResult?(string)
        }
        return vc
        
    }
    func updateUIViewController(_ uiViewController: ViewController2, context: Context) {}
    
}

struct Page : View {
    
    @State var showSheet = false
    var cb : (String)->Void

    var body : some View{
        
        Button("click me"){showSheet = !showSheet}
        
            .sheet(isPresented: $showSheet) {
                VC2View(){ result in
                    
                    print("result is \(result)")
                    showSheet = false
                }
                
            }
    }
}
