import Foundation
import ReSwift

struct CounterState: StateType {
    let value: Int
    
    init(value: Int) {
        self.value = value
    }
}
