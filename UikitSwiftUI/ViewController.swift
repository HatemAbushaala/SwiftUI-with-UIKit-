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
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .red
    }
    
    
}

// bridge between uikit view controller and swift ui view
struct VC2View : UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ViewController2 {
        return ViewController2()
    }
    
    func updateUIViewController(_ uiViewController: ViewController2, context: Context) {
        
    }
}

struct Page : View {
    
    @State var showSheet = false
    var cb : (String)->Void

    var body : some View{
        
        Button("click me"){
            showSheet = !showSheet
        }
        
        .sheet(isPresented: $showSheet) {
            VC2View()
        }
        
        
        
    }
}
