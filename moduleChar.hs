import Data.Char

encode :: Int -> String -> String  
encode shift msg = 
    let ords = map ord msg  
        shifted = map (+ shift) ords  
    in  map chr shifted

    decode :: Int -> String -> String  
    decode shift msg = encode (negate shift) msg  
main=do
    -- Data.Char
-- The Data.Char module does what its name suggests. It exports functions that deal with
--  characters. It's also helpful when filtering and mapping over strings because they're 
-- just lists of characters.
-- Data.Char exports a bunch of predicates over characters. That is, functions that take a
--  character and tell us whether some assumption about it is true or false. Here's what 
-- they are:


-- isControl checks whether a character is a control character.

-- isSpace checks whether a character is a white-space characters. That includes spaces, tab characters, newlines, etc.

-- isLower checks whether a character is lower-cased.

-- isUpper checks whether a character is upper-cased.

-- isAlpha checks whether a character is a letter.

-- isAlphaNum checks whether a character is a letter or a number.

-- isPrint checks whether a character is printable. Control characters, for instance, are not printable.

-- isDigit checks whether a character is a digit.

-- isOctDigit checks whether a character is an octal digit.

-- isHexDigit checks whether a character is a hex digit.

-- isLetter checks whether a character is a letter.

-- isMark checks for Unicode mark characters. Those are characters that combine with preceding letters to form latters with accents. Use this if you are French.

-- isNumber checks whether a character is numeric.

-- isPunctuation checks whether a character is punctuation.

-- isSymbol checks whether a character is a fancy mathematical or currency symbol.

-- isSeparator checks for Unicode spaces and separators.

-- isAscii checks whether a character falls into the first 128 characters of the Unicode character set.

-- isLatin1 checks whether a character falls into the first 256 characters of Unicode.

-- isAsciiUpper checks whether a character is ASCII and upper-case.

-- isAsciiLower checks whether a character is ASCII and lower-case.
print(all isAlphaNum "bobby283")
print(all isAlphaNum "eddy the fish!")
print(words "hey guys its me")
-- print(groupBy ((==) `on` isSpace) "hey guys its me")
-- print(filter (not . any isSpace) . groupBy ((==) `on` isSpace) $ "hey guys its me")
print(generalCategory ' ')
print(generalCategory 'A')
print(generalCategory 'a')
print(generalCategory '.')
print(generalCategory '9')
print(map generalCategory " \t\nA9?|")

-- toUpper converts a character to upper-case. Spaces, numbers, and the like remain 
-- unchanged.

-- toLower converts a character to lower-case.

-- toTitle converts a character to title-case. For most characters, title-case is the same 
-- as upper-case.

-- digitToInt converts a character to an Int. To succeed, the character must be in the 
-- ranges '0'..'9', 'a'..'f' or 'A'..'F'.
print(map digitToInt "34538")
print(map digitToInt "FF85AB")
-- intToDigit is the inverse function of digitToInt. It takes an Int in the range of 0..15 
-- and converts it to a lower-case character
print(intToDigit 15)
print(intToDigit 5)
-- The ord and chr functions convert characters to their corresponding numbers and vice 
-- versa:
print(ord 'a')
print(chr 97)
print(map ord "abcdefgh")
print(encode 3 "Heeeeey" )
print(encode 4 "Heeeeey")
print(encode 1 "abcd")
print(encode 5 "Marry Christmas! Ho ho ho!")


print(encode 3 "Im a little teapot")
print(decode 3 "Lp#d#olwwoh#whdsrw")
print(decode 5 . encode 5 $ "This is a sentence")