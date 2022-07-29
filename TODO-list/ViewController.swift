//
//  ViewController.swift
//  TODO-list
//
//  Created by Julia Semyzhenko on 3/18/22.
//

import UIKit

class ViewController: UIViewController  {
    
    var tasks = [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tasks = UserDefaults.standard.stringArray(forKey: "tasks") ?? []
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? AddTaskViewController else {
            return
        }
        vc.delegate = self
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
    }
}

extension ViewController: AddTaskViewControllerDelegate {
    
    func enteredTaskInfo(_ text: String) {
        DispatchQueue.main.async {
            var currentTasks = UserDefaults.standard.stringArray(forKey: "tasks") ?? []
            currentTasks.append(text)
            UserDefaults.standard.setValue(currentTasks, forKey: "tasks")
            self.tasks.append(text)
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdn", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}
