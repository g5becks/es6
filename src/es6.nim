import jsffi
#[
  Ecmascript 2015 apis
]#

var NaN* {.importjs: "NaN".}: int
var Infinity* {.importjs: "Infinity".}: int

proc eval*(x: cstring): any {.importjs: "eval(#)".}
  ##  Evaluates JavaScript code and executes it.
  ##  @param x A String value that contains valid JavaScript code.

proc parseInt*(s: cstring, radix: int | JsObject = jsUndefined): int {.
    importjs: "parseInt(#)".}
    ## Converts a string to an integer.
    ## @param s A string to convert into a int.
    ## @param radix A value between 2 and 36 that specifies the base of the int in numString.
    ## If this argument is not supplied, strings with a prefix of '0x' are considered hexadecimal.
    ## All other strings are considered decimal.

proc parseFloat*(s: cstring): float32 {.importjs: "parseFloat(#)".}
    ## Converts a string to a floating-point int.
    ## @param string A string that contains a floating-point int.

proc isNaN*(number: int): bool {.importjs: "isNaN(#)".}
    ## Returns a bool value that indicates whether a value is the reserved ## value NaN (not a int).
    ## @param int A numeric value.

proc isFinite*(number: int): bool {.importjs: "isFinite(#)".}
   ##[
    Determines whether a supplied int is finite.
    @param int Any numeric value.
   ]##

proc decodeURI*(encodedURI: cstring): string {.importjs: "decodeURI(#)".}
  ##[
 * Gets the unencoded version of an encoded Uniform Resource Identifier (URI).
 * @param encodedURI A value representing an encoded URI.
 ]##

proc decodeURIComponent*(encodedURIComponent: cstring): string {.
    importjs: "decodeURIComponent(#)".}
  ##[
  * Gets the unencoded version of an encoded component of a Uniform Resource Identifier (URI).
  * @param encodedURIComponent A value representing an encoded URI component.
   ]##

proc encodeURI*(uri: cstring): string {.importjs: "encodedURI(#)".}
    ##[
   Encodes a text string as a valid Uniform Resource Identifier (URI)
   @param uri A value representing an encoded URI.
   ]##
proc encodeURIComponent*(uriComponent: cstring | int | bool): string {.
    importjs: "encodeURIComponent(#)".}
  ##[
   Encodes a text string as a valid component of a Uniform Resource Identifier (URI).
   @param uriComponent A value representing an encoded URI component.
  ]##

proc escape*(str: cstring): string {.importjs: "escape(#)".}
    ##[
  Computes a new string in which certain characters have been replaced by a hexadecimal escape sequence.
  @param string A string value
  ]##

proc unescape*(str: cstring): string {.importjs: "unescape(#)".}
  ##[
  Computes a new string in which hexadecimal escape sequences are replace
  with the character that it represents.
   @param string A string value
  ]##

type Symbol* = ref object

proc toString*(self: Symbol): string {.importjs: "#.toString()".}
  ##  Returns a string representation of an object.

proc valueOf*(self: Symbol): Symbol {.importjs: "#.valueOf()".}
type PropertyKey* = cstring|int | Symbol

type PropertyDescriptor* = ref object
  configurable: bool
  enumerable: bool
  value: any
  writeable: bool

proc get*(self: PropertyDescriptor): any {.importjs: "#.get()".}

proc set*(self: PropertyDescriptor, value: any): void {.importjs: "#.set(#)".}

type JsDict*[K, V] = ref object
type PropertyDescriptorMap* = JsDict[cstring, PropertyDescriptor]

type JsObject = ref object

proc toString*(self: JsObject): string {.importjs: "#.toString()".}
  ## Returns a string representation of an object


proc toLocaleString*(self: JsObject): string {.importjs: "#.toLocaleString()".}
  ##[ Returns a date converted to a string using the current locale. ]##

proc valueOf*(self: JsObject): JsObject {.importjs: "#.valueOf()".}
    ##[ Returns the primitive value of the specified object. ]##

proc hasOwnProperty*(self:JsObject, v: PropertyKey): bool {.importjs: "#.hasOwnProperty(#)".}
    ##[
     * Determines whether an object has a property with the specified name.
     * @param v A property name.
     ]##

proc isPrototypeOf*(self: JsObject ,v: JsObject): bool {.importjs: "#.isPrototypeOf(#)".}
    ## Determines whether an object exists in another object's prototype chain.
    ##  @param v Another object whose prototype chain is to be checked.


proc propertyIsEnumerable*(self: JsObject v: PropertyKey): bool {.importjs: "#.propertyIsEnumerable(#)".}
        ##[
     * Determines whether a specified property is enumerable.
     * @param v A property name.
     ]##