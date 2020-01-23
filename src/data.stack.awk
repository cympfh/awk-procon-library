# Stack
function stack_new(stack) {
    stack[0] = 0; # length
    stack[1] = 1; # head
}
function stack_top(stack) {
    return stack[stack[1]];
}
function stack_pop(stack) {
    if (stack[0] == 0) return;
    stack[0]--;
    return stack[stack[1]--];
}
function stack_push(stack, x) {
    stack[0]++;
    stack[++stack[1]] = x;
}
function stack_display(stack, _, line, i) {
    line = ""
    for (i = 1; i <= stack[0]; ++i) {
        line = line stack[i+1] " "
    }
    print "[" line "]"
}
