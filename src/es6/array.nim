import jsffi
type JsArray*[T] = ref object

proc length*(self: JsArray): int {.
    importcpp: "#.length", noSideEffect.}
    ## Gets length of the array. This is a number one higher than the highest element defined in an array.
proc length*(self: JsArray, x: int): int {.
    importcpp: "#.length = #", noSideEffect.}
    ## sets the length of the array. This is a number one higher than the highest element defined in an array.

proc toString*(self: JsArray): string {.
    importcpp: "#.toString(#)", noSideEffect.}
    ## Returns a string representation of an array.

proc toLocaleString*(self: JsArray): string {.
    importcpp: "#.toLocalString(#)", noSideEffect.}
    ## Returns a string representation of an array. The elements are converted to string using their toLocalString methods.
proc pop[T](self: JsArray[T]): T {.
    importcpp: "#.pop()", noSideEffect.}

proc concat*[T](self: JsArray[T], arrays: varargs[JsArray[T]]): JsArray[T] {.
    importcpp: "#.concat(#)", noSideEffect.}


proc jsArray*[T](items: varargs[T]): JsArray[T] {.
    importcpp: "Array.from(#)", noSideEffect.}

proc map*[T, U](self: JsArray[T], callback: proc(val: T): U): JsArray[U] {.
    importcpp: "#.map(#)", noSideEffect.}

proc map*[T, U](self: JsArray[T], callback: proc(val: T,
    index: int): U): JsArray[U] {.importcpp: "#.map(#)", noSideEffect.}

proc map*[T, U](self: JsArray[T], callback: proc(val: T, index: int,
    array: JsArray[T]): U): JsArray[U] {.importcpp: "#.map(#)", noSideEffect.}
