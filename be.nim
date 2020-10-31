import jsffi

var console {.importc, nodecl.}: JsObject

let people = JsObject{name: cstring("gary")}

console.log people
