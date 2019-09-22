//
//  DetailViewController.swift
//  Habit Grower5
//
//  Created by Wendy Zhang on 9/21/19.
//  Copyright © 2019 Rice University. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    var habits = [Habit]()
    
    var image = UIImage()
    var name = ""
    
    @IBOutlet weak var scoreLabel: UILabel!
    var score = Habit(context: PersistenceServce.context).exp
    
    override func viewDidLoad() {
       
        
        
        super.viewDidLoad()
        lbl.text = "Your habit is \(name)"
        img.image = image
        
        let fetchRequest: NSFetchRequest<Habit> = Habit.fetchRequest()
        
        do {
            let habit = try PersistenceServce.context.fetch(fetchRequest)
            self.habits = habit
            
        } catch {}
        scoreLabel.text = "\(score)"
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func increaseScore(_ sender: Any) {
        print(lbl.text)
        var habit = Habit(context: PersistenceServce.context)
        for i in 0...HabitsData.habits.count-1 {
            print(HabitsData.habits[i].name)
            if "Your habit is " + HabitsData.habits[i].name! == lbl.text {
               habit = HabitsData.habits[i]
            }
        }
        habit.updateClockedIn()
        var score = habit.exp
        scoreLabel.text = "\(score)"
        PersistenceServce.saveContext()
    }
    
    @IBAction func saveData(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntity.setValue(score, forKey: "number")
        
        do {
            try context.save()
            print("saved")
        } catch {
            print("Failed saving")
        }
    }
    
    func getData()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                score = Double(data.value(forKey: "number") as! Int)
            }
        } catch {
            print("Failed")
        }
    }
}
