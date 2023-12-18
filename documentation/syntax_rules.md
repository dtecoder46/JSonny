# JSonny

![JSonny](jsonny.jpg)

A faster way to write JSON that is inspired by TailwindCSS syntax simplicity

## The Rules
In the data.son file, **all of your code must be on one line** and is split into chunks separated by this group of characters: " | " (without the quotes). These chunks are called operations, and within them they contain abbreviated words called commands (which indicate which JSON type to write into data.json) and various parameters that provide additional information about the JSON code. Below is a list of commands with corresponding parameters **(note that within parameter names you cannot have spaces or else the JSON code will be messed up)**

_Commands and Parameters:_
* *kv [tier] [key] [value]*
  * kv: indicates a JSON key-value pair
  * [tier]: number of indents preceding the key-value pair (**must be specified within each operation**)
  * [key]: name of your data
  * [value]: data value
* *li [tier] [key] [item1].[item2].[item3]*
  * li: indicates a JSON array
  * [tier]: see kv/tier
  * [key]: see kv/key
  * [itemx]: each item in the array (note that **you must separate each array item with a period** and that you are not limited to the number of array items)
* *obj [key] [tier]*
  * obj: indicates a JSON object
  * [key]: see kv/key
  * [tier]: see kv/tier, but note that **the tier number must be specified at the end of the object operation**
* *end [tier]*
  * end: marks the end of a JSON object
  * [tier]: see kv/tier, but note that **the tier number must be specified at the end of the object operation**

## My Signature

![Signature](sig.jpeg)