document.oncontextmenu = function () {
    return false;
}
$(document).keydown(function (event) {
    if (// e.keyCode === 67 || //contol + c
            //event.keyCode === 86 || // contol + v
            // event.keyCode === 85 || // contol + u
            event.keyCode == 123 || // contol + f12
            event.keyCode === 117
            ) {
        return false;
    } else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) {
        return false;
    }
});
$(document).on("contextmenu", function (e) {
    e.preventDefault();
});