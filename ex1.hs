{-- Exercicio Lista 1
Aluno: Saulo Weikert Bicalho--}

{-- queestao 1 --}

import Prelude hiding (map, dropWhile,break,words,concat)
import Data.Char
import Data.List(sort,sortBy)

map::(a->b)->[a]->[b]
map f [] = []
map f (x:xs) = f x : map f (xs)

{--Questao 2--}

mudaPraMinusc:: String -> String
mudaPraMinusc = map toLower

{--Questao 3--}

dropWhile::(a -> Bool) -> [a] -> [a]
dropWhile p [] = []
dropWhile p (a:x)
 | p a = dropWhile p x
 | otherwise = a : x

{--Questao 4--}

break::(a-> Bool) -> [a] -> ([a],[a])
break p = span (not.p)

{--Questao 5--}

splitWith:: (a->Bool) -> [a] -> [[a]]
splitWith p = splitWith' p . dropWhile p
splitWith' p [] = []
splitWith' p x = x1: splitWith p x2
 where (x1,x2) = break p x

words:: String -> [String]
words = splitWith isSpace

{--Questao 6--}

contaOcs:: [String] -> [(Int,String)]
contaOcs [] = []
contaOcs [x] = [(1,x)]
contaOcs (x1:x2:xs)
     | x1 == x2, ((yi, yv):ys) <- contaOcs (x2:xs) = (yi+1, yv) : ys
     | otherwise = (1, x1) : contaOcs (x2:xs)

{--Questao 7--}

concat:: [[a]] -> [a]
concat = foldr (++) []

{--Questao 8--}

palavrasMaisComuns:: Int -> String -> String
palavrasMaisComuns n = concat .map preencheLinha .take n .sortBy (\(a,_) (b,_) -> compare b a) .contaOcs.sort.words.mudaPraMinusc

preencheLinha:: (Int,String) -> String
preencheLinha (a,b) = b ++ " " ++ (show a) ++ "\n"
