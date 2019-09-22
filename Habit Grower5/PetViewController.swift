//
//  PetViewController.swift
//  Habit Grower5
//
//  Created by Wendy Zhang on 9/22/19.
//  Copyright © 2019 Rice University. All rights reserved.
//

import UIKit
import CoreData

class PetViewController: UIViewController {
    
    var image1 = UIImage()
    
    @IBOutlet weak var text: UITextField!
    var habits = [Habit]()
    
    @IBAction func chooseMe(_ sender: Any) {
        
        let habit = Habit(context: PersistenceServce.context)
        habit.name = text.text!
        habit.id = UUID().uuidString
        habit.birthday = Date()
        habit.lastClockedIn = Date()
        habit.image = image1
        HabitsData.habits.append(habit)
        PersistenceServce.saveContext()
        
        
    }
    
    var petImage = UIImage()
    var habitName = ""
    var petName = ["one"]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        
        do {
            let habit = try PersistenceServce.context.fetch(fetchRequest)
            self.habits = habit
            
        } catch {}
    }
    
    @IBOutlet weak var tableViewPet: UITableView!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
extension PetViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let petcell = tableView.dequeueReusableCell(withIdentifier: "petcell", for: indexPath)as? PetTableViewCell
        
        petcell?.petimg.image = UIImage(named: petName[indexPath.row])
        return petcell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        vc?.image = UIImage(named: "one")!
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}

