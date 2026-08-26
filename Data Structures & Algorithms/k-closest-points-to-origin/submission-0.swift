class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        
        let distances = points.sorted(by: { left, right in
            getPointDistance(left) < getPointDistance(right)
        })

        return Array(distances.prefix(k))
    }

    func getPointDistance(_ point: [Int]) -> Int {
        square(point[0]) + square(point[1])
    }

    func square(_ value: Int) -> Int {
        value * value
    }
}
