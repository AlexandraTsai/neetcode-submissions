class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var heap = stones.sorted(by: > )
        while heap.count > 1 {
            let first = heap.removeFirst()
            let second = heap.removeFirst()

            let diff = abs(first - second)

            guard diff > 0 else { continue }

            if let index = heap.firstIndex(where: { $0 <= diff }) {
                heap.insert(diff, at: index)
            } else {
                heap.append(diff)
            }
        }
        return heap.first ?? 0
    }
}

