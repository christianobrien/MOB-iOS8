import UIKit

class CheckbookVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var checkbookTableView: UITableView!
    @IBOutlet weak var transactionTF: UITextField!
    @IBOutlet weak var amountSpentTF: UITextField!
    
    var checkbookDictionary : [String:String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keybaordShow", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardHide", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return checkbookDictionary.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("checkbookCell")! as UITableViewCell
        let key = Array(checkbookDictionary.keys)[indexPath.row]
        cell.textLabel?.text = key
        cell.detailTextLabel?.text = checkbookDictionary[key]
        return cell
    }
        
    @IBAction func amountSpentTFEnterClicked(sender: AnyObject) {
        if (transactionTF.text == "" || transactionTF.text == "Enter what you paid for"){
            transactionTF.text = "Enter what you paid for"
        } else if (amountSpentTF.text == "" || amountSpentTF.text == "Enter What you paid for") {
            amountSpentTF.text = "Enter What you paid for"
        } else {
        
        amountSpentTF.resignFirstResponder()
        checkbookDictionary[transactionTF.text!] = amountSpentTF.text
        
        checkbookTableView.reloadData()
            
        }
    }
    
    func keyboardShow() {
        transactionTF.backgroundColor = UIColor.yellowColor()
        amountSpentTF.backgroundColor = UIColor.yellowColor()
    }
    
    func keyboardHide() {
        transactionTF.backgroundColor = UIColor.orangeColor()
        amountSpentTF.backgroundColor = UIColor.orangeColor()
    }
    
}
