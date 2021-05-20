# Queue
function queue_new(q) {
    q[0] = 0;  # length
    q[1] = 3;  # head
    q[2] = 2;  # tail
}
function queue_length(q) { return q[0] }
function queue_top(q) { return q[q[1]] }
function queue_pop(q) {
    if (q[0] == 0) return;
    q[0]--;
    return q[q[1]++];
}
function queue_push(q, x) {
    q[0]++;
    q[2]++;
    q[q[2]] = x;
}
function queue_display(q, _, line, i) {
    line = ""
    for (i = q[1]; i <= q[2]; ++i) {
        line = line q[i] " "
    }
    print "[" line "]"
}
