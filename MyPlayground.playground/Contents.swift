import Cocoa


class Board: CustomStringConvertible {
    var values: [Int]
    let kSize = 9 // number of rows and columns
    
    init(_ string: String) {
        values = string.characters.map { Int(String($0)) ?? 0 }
    }
    
    var empty: Int? {
        return values.index(of: 0)
    }
    
    func possibleValues(for index: Int) -> [Int] {
        
        let possible = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        var assigned: [Int] = []
        
        // same row
        var row = index / kSize
        for column in 0..<kSize {
            assigned.append(values[row * kSize + column])
        }
        
        // same column
        var column = index % kSize
        for row in 0..<kSize {
            assigned.append(values[row * kSize + column])
        }
        
        // 3x3 box
        row = 3 * (index / (3 * kSize))
        column = 3 * ((index % kSize) / 3)
        for r in 0..<3 {
            for c in 0..<3 {
                let index = (row + r) * kSize + (column + c)
                assigned.append(values[index])
            }
        }
        
        return possible.filter({!assigned.contains($0)})
    }
    
    var description: String {
        return values.enumerated().reduce("") { result, current in
            var separator = ""
            if current.0 != 0 && current.0 % 9 == 0 {
                separator = "\n"
            }
            return result + separator + String(current.1)
        }
    }
}

func solve(board: Board) -> Bool {
    guard let empty = board.empty else { return true }
    
    for i in board.possibleValues(for: empty) {
        board.values[empty] = i
        if solve(board: board) { return true }
        board.values[empty] = 0
    }
    
    return false
}


let grid = "005300000800000020070010500400005300010070006003200080060500009004000030000009700"
let board = Board(grid)
_ = solve(board: board)
print(board)
