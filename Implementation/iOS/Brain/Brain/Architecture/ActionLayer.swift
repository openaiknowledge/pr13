//  ActionLayer.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
//  Base protocols for Action layer

protocol ActionLayer: Layer {
    var eventsDispatcher: EventsDispatcher? { get }    
}

// MARK: - process
protocol ActionProcess: Process {
    var eventsDispatcher: EventsDispatcher { get }
}

// MARK: - activities
protocol MapperSignalToEventActivity: Activity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Event?
}
extension MapperSignalToEventActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal? {
        return nil // TODO
    }
}
protocol FilterActionActivity: Activity {
    func exec(event: Event, fromLayer: Layer, fromProcess: Process) -> Event?

}
extension FilterActionActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal? {
        return nil // TODO
    }
}
protocol RepresentationOfEventActivity: Activity {
    func exec(event: Event, fromLayer: Layer, fromProcess: Process) -> Event?

}
extension RepresentationOfEventActivity {
    func exec(signal: Signal, fromLayer: Layer, fromProcess: Process) -> Signal? {
//         TODO
        return nil
    }
}
// MARK: - models
protocol MapperSignalToEventModel: ActivityModel {
    
}

protocol FilterActionModel: ActivityModel {
    
}

protocol RepresentationOfEventModel: ActivityModel {
    
}
