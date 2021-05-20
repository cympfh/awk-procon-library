# n! Permutation
#
# Args:
#   n: length of array
#   idx: index of permutation (1 <= idx <= n!)
#   r: return array
# Return:
#   success: bool
function permutation(n, idx, r) {
    idx--
    r[n] = 1
    for (k = 2; k <= n; ++k) {
        r[n + 1 - k] = 1 + (idx % k)
        idx = int(idx / k)
    }
    if (idx > 0) return 0;
    for (i = 1; i <= n; ++i) b[i] = 1;
    b[r[1]] = 0;
    for (k = 2; k <= n; ++k) {
        count = 1
        for (j = 1; j <= n; ++j) {
            if (b[j]) {
                if (count == r[k]) {
                    r[k] = j
                    b[j] = 0
                    break
                }
                count++
            }
        }
    }
    return 1
}
