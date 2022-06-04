//  WeakArray.swift
//  Brain
//
//  Created by Miguel Gutierrez on 10/01/2022
//
// https://frouo.com/posts/swift-how-to-declare-an-array-of-weak-references
import Foundation

typealias WeakArray<T> = [() -> T?]
//other option: typealias WeakElement<T> = () -> T?
// TODO: try to remove duplicate code: function -> weak() for Activity, Layer, Process
extension Array where Element == Activity {
    func weak() -> WeakArray<Element> {
        let arrayMapped: WeakArray<Element> = map { element in
            let function: (() -> Element?) = { [weak element] in
                element
            }
            
            return function
        }
        return arrayMapped
        
    }
}
extension Array where Element == Layer {
    func weak() -> WeakArray<Element> {
        let arrayMapped: WeakArray<Element> = map { element in
            let function: (() -> Element?) = { [weak element] in
                element
            }
            
            return function
        }
        return arrayMapped
    }
}

extension Array where Element == Process {
    func weak() -> WeakArray<Element> {
        let arrayMapped: WeakArray<Element> = map { element in
            let function: (() -> Element?) = { [weak element] in
                element
            }
            
            return function
        }
        return arrayMapped
        
    }
}
extension Array where Element == SystemOutputController {
    func weak() -> WeakArray<Element> {
        let arrayMapped: WeakArray<Element> = map { element in
            let function: (() -> Element?) = { [weak element] in
                element
            }
            
            return function
        }
        return arrayMapped
        
    }
}
/*
extension Array where Element: AnyObject {
    // it doesn´t work when We use in activities.weak() -> "Referencing instance method 'weak()' on 'Array' requires that 'Activity' be a class type"
 
    func weakElement() -> WeakArray<Element> {
        
        let arrayMapped: WeakArray<Element>

        arrayMapped = map { element in
            let function: (() -> Element?) = { [weak element] in
                element
            }
            
            return function
        }
        return arrayMapped
        
    }
}
 */
