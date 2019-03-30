//
//  AStar.swift
//  Quiz 2
//
//  Created by Salsha Armenia Amosea on 30/03/19.
//  Copyright © 2019 Salsha Armenia Amosea. All rights reserved.
//

import Foundation

class Node<T: Hashable>: Comparable, Hashable {
    let state: T
    let parent: Node?
    let cost: Float
    let heuristic: Float
    init(state: T, parent: Node?, cost: Float, heuristic: Float) {
        self.state = state
        self.parent = parent
        self.cost = cost
        self.heuristic = heuristic
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(state)
        hasher.combine(parent)
        hasher.combine(cost)
        hasher.combine(heuristic)
    }
}

func < <T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
    return (lhs.cost + lhs.heuristic) < (rhs.cost + rhs.heuristic)
}

func == <T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
    return lhs === rhs
}

func backtrack<T>(_ goalNode: Node<T>) -> [T] {
    var sol: [T] = []
    var node = goalNode
    
    while (node.parent != nil) {
        sol.append(node.state)
        node = node.parent!
    }
    
    sol.append(node.state)
    
    return sol
}

func astar<T: Hashable>(_ initialState: T, goalTestFn: (T) -> Bool, successorFn: (T) -> [T], heuristicFn: (T) -> Float) -> [T]? {
    var frontier = PriorityQueue(ascending: true, startingValues: [Node(state: initialState, parent: nil, cost: 0, heuristic: heuristicFn(initialState))])
    var explored = Dictionary<T, Float>()
    explored[initialState] = 0
    var nodesSearched: Int = 0
    
    while let currentNode = frontier.pop() {
        nodesSearched += 1

        let currentState = currentNode.state
        
        if goalTestFn(currentState) {
            print("Searched \(nodesSearched) nodes.")
            return backtrack(currentNode)
        }
        
        for child in successorFn(currentState) {
            let newcost = currentNode.cost + 1
            if (explored[child] == nil) || (explored[child]! > newcost) {
                explored[child] = newcost
                frontier.push(Node(state: child, parent: currentNode, cost: newcost, heuristic: heuristicFn(child)))
            }
        }
    }
    
    return nil
}
