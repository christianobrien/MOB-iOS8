import UIKit

class NotesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var notesArray = [String]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("notesCell", forIndexPath: indexPath)

        cell.textLabel?.text = notesArray[indexPath.row] as String
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // For some reason, this doesn't allow you to type until you click the text field.
//        notesTextField!.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Ends editing if click on background view
        self.view.endEditing(true)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // Deletes row of Array
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            notesArray.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        // delegate method - Used to make return key push chanegs to notesArray 
        
            notesArray.append(notesTextField.text!)
            notesTextField.text = ""
            tableView.reloadData()
        
        //Disable for "Return" to turn on editing in notesTextField
            notesTextField.resignFirstResponder()
        
            return true
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if  cell?.accessoryType == .Checkmark {
            cell?.accessoryType = .None
        } else {
            cell?.accessoryType = .Checkmark
        }
    }
    
    
    
}