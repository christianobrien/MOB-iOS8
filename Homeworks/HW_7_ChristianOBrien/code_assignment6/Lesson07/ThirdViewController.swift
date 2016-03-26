import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var textBox: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func nextButtonClicked(sender: AnyObject) {
        performSegueWithIdentifier("toFourthVC", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let fourthVC = segue.destinationViewController as! FourthViewController
        fourthVC.textFromPreviousVC = self.textBox.text
        //This should set the text in the 4th controller to the same as the text in the 3rd.
    }
}
