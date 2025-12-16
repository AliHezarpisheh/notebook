# Regular Expressions (regex)

A Regular Expressions is a sequence of characters that specifies a matching pattern in a
text.

## Regex Basics

First of all, you can write whatever you want to match it. For example, ali will match
ali in a text:) It's like searching a string in a text.

| Anchors | Description                                          | Examples                                          |
| ------- | ---------------------------------------------------- | ------------------------------------------------- |
| `*`     | Repeating the previous character 0 or more times.    | a\*b -> b, ab, aaab, aaaaaaaaaaaaaaab             |
| `.`     | Any character.                                       | a.b -> aab, acb                                   |
| `+`     | Repeating the previous character more than one time. | a\*b -> ab, aaab, aaaaaaaaaaaab                   |
| `^`     | The string should start with the next pattern.       | ^a -> ali, aaaaa, america / ^ab -> aba, aaab(NO!) |
| `$`     | The string should end with the previous character.   | $b -> aaab, b, bb                                 |
| `?`     | Zero or one repeat of the previous character.        | d?c -> c, dc, ddc(NO!)                            |
| `\|`    | Or.                                                  | a                                                 |
| `[]`    | Classes.                                             | [abc] -> a, b, c / [a-z] -> from a to z           |
| `\d`    | Every digit.                                         | --                                                |

> Regex is case-sensitive.

You can use commonly used classes that has names and are prepared from before:

| Range                       | Meaning                                                                                              |
| --------------------------- | ---------------------------------------------------------------------------------------------------- |
| `[:alnum:]`                 | Alphanumeric characters.                                                                             |
| `[:blank:]`                 | Space and tab characters.                                                                            |
| `[:digit:]`                 | The digits 0 through 9 (equivalent to 0-9).                                                          |
| `[:upper:]` and `[:lower:]` | Upper and lower case letters, respectively.                                                          |
| `^` (negation)              | As the first character after `[` in a character class negates the sense of the remaining characters. |
