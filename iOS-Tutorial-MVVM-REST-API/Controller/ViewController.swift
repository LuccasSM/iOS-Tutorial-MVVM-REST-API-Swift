//
//  ViewController.swift
//  iOS-Tutorial-MVVM-REST-API
//
//  Created by Luccas Santana Marinho on 27/04/22.
//

import UIKit

class ViewController: UIViewController {

    let parser = Parser()
    var contacts = [Contact]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "API REST - MVVM"
        
        parser.parse {
            data in
            self.contacts = data
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name
        cell.selectionStyle = .none
        return cell
    }
}
