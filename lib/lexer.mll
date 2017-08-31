{
  exception Error of string

  let error fmt = Printf.kprintf (fun msg -> raise (Error msg)) fmt
  let get       = Lexing.lexeme
}

let digit   = ['0'-'9']
let lower   = ['a'-'z']
let upper   = ['A'-'Z']
let punct   = ['_']

rule split = parse
| upper+ (lower|digit)* { let word = get lexbuf in word :: split lexbuf }
| eof                   { [] }
| _                     { get lexbuf |> error "illegal character '%s'" }

{

let snake_case str =
  Lexing.from_string str
  |> split
  |> ( function
     | []    -> []
     | x::xs -> x :: List.map String.lowercase_ascii xs
     )
  |> String.concat "_"
}
