//
//  ViewController.swift
//  Reactify
//
//  Created by Bart Jacobs on 17/09/2019.
//  Copyright © 2019 Cocoacasts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    // MARK: - Properties
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            // Configure Table View
            tableView.dataSource = self
        }
    }
    
    @IBOutlet var button: UIButton! {
        didSet {
            // Configure Button
            button.backgroundColor = .gray
            
            // Configure Layer Button
            button.layer.cornerRadius = 22.0
            button.layer.masksToBounds = true
        }
    }
    
    // MARK: -
    
    private var items: [Date] = []
    
    // MARK: -
    
    private let dateFormatter: DateFormatter = {
        // Initialize Date Formatter
        let dateFormatter = DateFormatter()
        
        // Configure Date Formatter
        dateFormatter.dateFormat = "MMM d, HH:mm:ss"
        
        return dateFormatter
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Observe Did Enter Background Notification
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: UIApplication.shared, queue: nil) { (_) in
            print("did enter background")
        }
    }
    
    // MARK: - Actions
    
    @IBAction func addItem(_ sender: UIButton) {
        // Append Item
        items.append(Date())
        
        // Reload Table View
        tableView.reloadData()
    }

    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue Reusable Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        // Fetch Item
        let item = items[indexPath.row]
        
        // Configure Cell
        cell.textLabel?.text = dateFormatter.string(from: item)
        
        return cell
    }
    
}
