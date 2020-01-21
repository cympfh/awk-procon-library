# Quick sort O(n log n)
function sort(xs, n) {
    sort_sub(xs, 1, n);
}
function sort_sub(xs, left, right, _, pivot, i, n_lt, n_eq, n_gt, lt, gt) {
    if (left >= right) return;
    pivot = xs[left];
    n_lt = 0;
    n_eq = 0;
    n_gt = 0;
    for (i = left; i <= right; ++i) {
        if (xs[i] < pivot) {
            n_lt++;
            lt[n_lt] = xs[i];
        } else if (xs[i] == pivot) {
            n_eq++;
        } else {
            n_gt++;
            gt[n_gt] = xs[i];
        }
    }
    for (i = 1; i <= n_lt; ++i) {
        xs[left + i - 1] = lt[i];
    }
    for (i = 1; i <= n_eq; ++i) {
        xs[left + n_lt + i - 1] = pivot;
    }
    for (i = 1; i <= n_gt; ++i) {
        xs[left + n_lt + n_eq + i - 1] = gt[i];
    }
    sort_sub(xs, left, left + n_lt - 1);
    sort_sub(xs, right - n_gt + 1, right);
}
