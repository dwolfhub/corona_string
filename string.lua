-- Development by Daniel Wolf
-- For Oncall Interactive


--- String Library
local StringLib = {}

--- takes in a table and converts the information to a query string
--@param table data the data to be converted to a query string
function StringLib.tableToQueryString(data)
    
    -- sub function urlEncode encodes the input string's special chars
    --@param string str the string to encode
    function StringLib.urlEncode(str)
      if str then
        str = string.gsub(str, '\n', '\r\n')
        str = string.gsub(str, '([^%w ])', function(c)
          return string.format('%%%02X', string.byte(c))
        end)
        str = string.gsub(str, ' ', '+')
      end
      return str
    end
    
    -- create a table of key pairs (key=pair)
    -- urlEncode the values to be sure they are safe for a query string
    local queryStringData = {}
    for index,value in pairs(data) do
        table.insert(queryStringData, index.."="..StringLib.urlEncode(value))
    end
    
    -- concat the key pairs, placing an & in the middle of each, then return this string
    return table.concat(queryStringData, "&")
end

return StringLib;
