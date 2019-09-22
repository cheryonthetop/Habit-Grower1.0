//
//  ViewController.swift
//  Habit Grower5
//
//  Created by Yingfan Chen on 9/21/19.
//  Copyright © 2019 Rice University. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var habits = [Habit]()
    @IBOutlet weak var tableView: UITableView!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        
        do {
            let habit = try PersistenceServce.context.fetch(fetchRequest)
            self.habits = habit
            
        } catch {}
    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)as? Cell2TableViewCell
        cell2?.lbl.text = habits[indexPath.row].name
        cell2?.img.image = UIImage(named: "one")
        return cell2!
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.image = UIImage(named: "one")!
        vc?.name = habits[indexPath.row].name ?? ""
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}



