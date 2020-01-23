# Quick Sort (in-place version)
function sort(xs, n) {
    sort_sub(xs, 1, n);
}
function swap(xs, i, j) {
    if (i == j) return;
    t = xs[i]; xs[i] = xs[j]; xs[j] = t;
}
function sort_sub(xs, left, right, _, i, pivot, lt_left, lt_right, eq_left, eq_right, gt_left, gt_right) {
    if (left >= right) return;
    pivot = xs[right];
    lt_left = left
    lt_right = left - 1
    eq_left = left
    eq_right = left - 1
    gt_left = left
    gt_right = left - 1
    for (i = left; i <= right; ++i) {
        if (xs[i] < pivot) {
            if (eq_left < gt_left) swap(xs, eq_left, i);
            swap(xs, gt_left, i);
            lt_right++;
            eq_left++;
            eq_right++;
            gt_left++;
            gt_right++;
        } else if (xs[i] == pivot) {
            swap(xs, gt_left, i);
            eq_right++;
            gt_left++;
            gt_right++;
        } else {
            gt_right++;
        }
    }
    sort_sub(xs, lt_left, lt_right);
    sort_sub(xs, gt_left, gt_right);
}
