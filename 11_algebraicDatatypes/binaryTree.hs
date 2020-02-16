data BinaryTree a = Leaf
                  | Node (BinaryTree a) a (BinaryTree a)
                  deriving (Eq, Ord, Show)


insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf
insert' b (Node left a right)
  | b == a = Node left a right
  | b < a  = Node (insert' b left) a right
  | b > a  = Node left a (insert' b right)


t1 = insert' 0 Leaf
t2 = insert' 3 t1
t3 = insert' 5 t2
t4 = insert' 2 t2

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree fun Leaf = Leaf
mapTree fun (Node left a right) = Node x (fun a) y
  where x = mapTree fun left
        y = mapTree fun right


testTree' :: BinaryTree Integer
testTree' =
  Node (Node Leaf 3 Leaf)
       1
       (Node Leaf 4 Leaf)

mapExpected =
  Node (Node Leaf 4 Leaf)
  2
  (Node Leaf 5 Leaf)


mapOkay =
  if mapTree (+1) testTree' == mapExpected
  then print "yup okay!"
  else error "test failed!"


preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left a right) = x ++ y ++ z
  where
    x = [a]
    y = preorder left
    z = preorder right

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left a right) = x ++ y ++ z
  where
    x = preorder left
    y = [a]
    z = preorder right

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node left a right) = x ++ y ++ z
  where
    x = postorder left
    y = postorder right
    z = [a]

testTree :: BinaryTree Integer
testTree =
  Node (Node Leaf 1 Leaf)
       2
       (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder =
  if preorder testTree == [2, 1, 3]
  then putStrLn "Preorder fine!"
  else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder =
  if inorder testTree == [1, 2, 3]
  then putStrLn "Inorder fine!"
  else putStrLn "Bad news bears."

testPostorder :: IO ()
testPostorder =
  if postorder testTree == [1, 3, 2]
  then putStrLn "Postorder fine!"
  else putStrLn "postorder failed check"

main :: IO ()
main = do
  testPreorder
  testInorder
  testPostorder

foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ z Leaf = z
foldTree f z (Node left x right) = bothFolded
  where
    leftFolded = f x (foldTree f z left)
    bothFolded = foldTree f leftFolded right
