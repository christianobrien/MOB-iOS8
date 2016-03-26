import UIKit

class FifthViewController: UIViewController {
    
    @IBOutlet weak var textBox: UITextView!
    
    var textForSixthVC : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("toSixthVC", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sixthVC = segue.destinationViewController as! SixthViewController
        
        textForSixthVC = textBox.text.componentsSeparatedByString(" ")
        
        sixthVC.arrayFromFifthVC = self.textForSixthVC
        // pushing the array we've acquired in to sixth VC
    }
    
    
}
