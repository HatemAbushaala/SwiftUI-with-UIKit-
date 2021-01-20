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

struct Page : View {
    
    var cb : (String)->Void

    var body : some View{
        
        Button("click me"){
            cb("data from swiftt ui view ")
        }
        
        
        
    }
}
