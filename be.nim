type JsArray*[T] = ref object

var x*, y*, z*: int
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
proc pop*[T](self: JsArray[T]): T {.
    importcpp: "#.pop()", noSideEffect.}
    ## Removes the last element from an array and returns it.

proc push(self: JsArray[any]): void {.
    importcpp: """#.push(#)""".}
proc push*[T](self: JsArray[T], items: varargs[T]): int {.
    importcpp: """#.push(...#)""".}
proc concat*[T](self: JsArray[T], arrays: varargs[JsArray[T]]): JsArray[T] {.
    importcpp: "#.concat(...#)", noSideEffect.}


proc jsArray*[T](items: varargs[T]): JsArray[T] {.
        importcpp: "Array.from(#)", noSideEffect.}

proc map*[T, U](self: JsArray[T], callback: proc(val: T): U): JsArray[U] {.
    importcpp: "#.map(#)", noSideEffect.}

proc map*[T, U](self: JsArray[T], callback: proc(val: T,
    index: int): U): JsArray[U] {.importcpp: "#.map(#)", noSideEffect.}

proc map*[T, U](self: JsArray[T], callback: proc(val: T, index: int,
    array: JsArray[T]): U): JsArray[U] {.importcpp: "#.map(#)", noSideEffect.}

type JsObj[T: tuple] = ref object


type MapEntry = ref object

proc newEntry(k: any, v: any): MapEntry {.importcpp: "[#, #]", nodecl.}

proc newObj[T](arr: JsArray[MapEntry]): JsObj[T] {.
        importcpp: "Object.fromEntries(#)", nodecl.}

proc jsObj*[T: tuple](t: T): JsObj[T] =
    # needs type information at instantiation
    # jsArray[MapEntry[cstring, RootObj]] does not work
    var arr = jsArray[MapEntry]()
    for name, val in t.fieldPairs:
        discard arr.push(newEntry(cstring(name), val))
    result = newObj[T](arr)

type Console = ref object

proc assert*(self: Console, condition = false, data: varargs[any]): void {.
        importcpp: "#.assert(#, ...#)", nodecl.}

proc log*[T](self: Console, data: varargs[T]): void {.importcpp: "#.log(...#)", nodecl.}

var console {.importcpp, nodecl.}: Console


var me = jsObj (name: cstring "gary")

console.log me
