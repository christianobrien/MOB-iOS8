import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var testString: UILabel!
    @IBOutlet weak var testNumber: UILabel!
    
    var stringIn : String = "Hello there!"
    var numberIn : Int = 1234321
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSUserDefaults.standardUserDefaults().setObject(stringIn, forKey: "string_key")
        NSUserDefaults.standardUserDefaults().setObject(numberIn, forKey: "number_key")
        
        let readString = NSUserDefaults.standardUserDefaults().stringForKey("string_key")
        let readNumber = NSUserDefaults.standardUserDefaults().integerForKey("number_key")
        
        testString.text = String!(readString)
        testNumber.text = String(readNumber)       
        
    }
    
}