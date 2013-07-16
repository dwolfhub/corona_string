# String Manipulation Library

#### File Name
string.lua

#### Note
This will be an ever-growing list of functions to manipulate strings

## String.tableToQueryString(data)

#### Parameters
> - data (table) the data to be converted to a query string

#### Return
> - An html encoded query string

#### Example
```lua
local string = require "library.core.string"
local data = {
    foo = 'information',
    bar = 'special!@#chars'
}
local queryString = string.tableToQueryString(data)
print(queryString)
-- prints: bar=special%21%40%23chars&foo=information
```
