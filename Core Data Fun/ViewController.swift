
import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var tfName: UITextField!
    
    
    @IBAction func btnSaveClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "LocalDB", into: context)
        newUser.setValue(tfName.text!, forKey: "name")
        
        do {
            try context.save()
            print("Saved")
        }
        catch {
            // process Error
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional s
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
       
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "LocalDB")

        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let name = result.value(forKey: "name") as? String
                    {
                        print(name)
                        
                    }
                }
            }
        }
        catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

