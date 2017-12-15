import Foundation
import ReSwift

func reduce(action: Action, state: CounterState?) -> CounterState {
    let state = state ?? CounterState(value: 0)
    
    switch action {
    case _ as IncreaseCounterAction:
        return CounterState(value: state.value + 1)

    case _ as ResetCounterAction:
        return CounterState(value: 0)

    default:
        return state
    }
}
