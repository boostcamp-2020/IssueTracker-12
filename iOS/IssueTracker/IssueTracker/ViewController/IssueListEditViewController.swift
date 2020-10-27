//
//  IssueListEditViewController.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/26.
//

import UIKit
import M13Checkbox

class IssueListEditViewController: UIViewController {

    @IBOutlet weak var issueListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        issueListTableView.dataSource = self
        issueListTableView.delegate = self
        let nibName = UINib(nibName: IssueListEditTableViewCell.reuseIdentifier, bundle: nil)
        self.issueListTableView.register(nibName, forCellReuseIdentifier: IssueListEditTableViewCell.reuseIdentifier)
        let nibName2 = UINib(nibName: IssueListCollectionViewCell.reuseIdentifier, bundle: nil)
        self.issueListTableView.register(nibName2, forCellReuseIdentifier: IssueListCollectionViewCell.reuseIdentifier)
    }
    
    @IBAction func cancelButtonDidTouch(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension IssueListEditViewController: UITableViewDelegate {
    
}

extension IssueListEditViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IssueListEditTableViewCell.reuseIdentifier, for: indexPath) as? IssueListEditTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}
