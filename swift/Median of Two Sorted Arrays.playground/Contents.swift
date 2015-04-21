// Playground - noun: a place where people can play

/*::There are two sorted arrays A and B of size m and n respectively. Find the median of the two sorted arrays. The overall run time complexity should be O(log(m + n)).
*/

// O(n)
func median(a:[Int], b:[Int]) -> Int {
    var m = [Int]()
    var i = 0, j = 0
    
    while i < a.count && j < b.count {
        if a[i] < b[j] {
            m.append(a[i])
            i++
        } else {
            m.append(b[j])
            j++
        }
    }
    
    if i == a.count {
        m+=[Int](b[j...b.count-1])
    }
    if j == b.count {
        m+=[Int](a[i...a.count-1])
    }

    return m[m.count/2]
}

var A = [0,1,2,3,4,5]
var B = [2,3,5]
median(A, B)


var A1 = [0,1,2,3,4,5]
var B1 = [6,7,8]
median(A1, B1)

var A2 = [0,1,2,3,4,5]
var B2 = [3,7,8]
median(A2, B2)

// O(log(n))
func median2(a:[Int], b:[Int]) -> Int {
    var i = 0, j = 0
    var total = a.count + b.count
    return findKth(a, b, total/2)
}

func findKth(a:[Int], b:[Int], k:Int) -> Int {
    if a.count>b.count {
        return findKth(b, a, k)
    }
    if a.count == 0 {
        return b[k-1]
    }
    if (k == 1) {
        return min(a[0], b[0])
    }
    
    var ia = min(k/2, a.count), ib = k - ia
    if a[ia-1] < b[ib-1] {
        return findKth([Int](a[ia...a.count]), b, k-ia)
    } else if a[ia-1] > b[ib-1] {
        return findKth(a, [Int](ib...b.count), k-ia)
    } else {
        return a[ia-1]
    }
}
median2(A, B)
median2(A1, B1)
median2(A2, B2)


