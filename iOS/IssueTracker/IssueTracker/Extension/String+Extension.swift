//
//  String+Extension.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/31.
//

import Foundation

extension String {
    func isDate() -> Bool {
        let regex = "^(19|20)\\d\\d-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$"
        let dateValidation = NSPredicate.init(format: "SELF MATCHES %@", regex)
        
        return dateValidation.evaluate(with: self)
    }
}
