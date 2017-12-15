import UIKit
import ReSwift

class CounterViewController: UIViewController {
    // State management
    let store = Store(reducer: reduce, state: CounterState(value: 0), middleware: [])
    
    // UI components
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        updateCounterLabel(0)
    }
    
    @IBAction func increaseCounter() {
        store.dispatch(IncreaseCounterAction())
    }
    
    @IBAction func resetCounter() {
        store.dispatch(ResetCounterAction())
    }
    
    fileprivate func updateCounterLabel(_ counterValue: Int) {
        counterLabel.text = String(counterValue)
    }
}

extension CounterViewController: StoreSubscriber {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    func newState(state counterState: CounterState) {
        updateCounterLabel(counterState.value)
    }
}
