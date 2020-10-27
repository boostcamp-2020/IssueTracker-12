//
//  IssueListEditViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/26.
//

import UIKit

class IssueListEditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
