type JsArray*[T] = ref object

proc length*(self: JsArray): int {.
    importcpp: "#.length", noSideEffect.}
    ## Gets length of the array. This is a number one higher than the highest element defined in an array.
proc length*(self: JsArray, x: int): int {.
    importcpp: "#.length = #", noSideEffect.}
    ## sets the length of the array. This is a number one higher than the highest element defined in an array.


proc toString*(self: JsArray): string {.
    importcpp: "#.toString(#)", noSideEffect.}

proc toLocaleString*(self: JsArray): string {.
    importcpp: "#.toLocalString(#)", noSideEffect.}
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
