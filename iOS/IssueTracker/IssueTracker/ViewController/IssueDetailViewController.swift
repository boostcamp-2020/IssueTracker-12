//
//  IsueeDetailViewController.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/10/27.
//

import UIKit

class IssueDetailViewController: UIViewController {
    
    @IBOutlet weak var commentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
    }
}

extension IssueDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IssueDetailTableViewCell.reuseIdentifier, for: indexPath) as? IssueDetailTableViewCell else {
                    return UITableViewCell()
                }
                
        return cell
    }
}

extension IssueDetailViewController: UITableViewDelegate {
    
}
