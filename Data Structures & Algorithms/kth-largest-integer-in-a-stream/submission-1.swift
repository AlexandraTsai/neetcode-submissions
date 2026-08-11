class KthLargest {
    var nums: [Int]
    let k: Int

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = nums
    }

    func add(_ val: Int) -> Int {
        nums.append(val)
        let sorted = nums.sorted { $0 > $1 }
        return sorted[0..<k].last ?? 0
    }
}
