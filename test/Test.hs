module Test where
 
import System.Environment
import System.Process
import System.Directory
import System.FilePath
import System.Exit

main :: IO ()
main = do
    args <- getArgs
    case args of 
        [exec,dir] -> test exec dir
        _ -> putStrLn "Wrong number of arguments"

test :: FilePath -> FilePath -> IO()
test exec dir = do
    fps <- (listDirectory dir)
    let fps' = map (dir</>) fps
    mapM_ (testFile exec) fps'

testFile :: FilePath -> FilePath -> IO ()
testFile exec fp = do
    (ec, stdout, stderr) <- readProcessWithExitCode exec [fp] "" 
    case ec of
        ExitSuccess -> putStr $ "OK: " ++ fp ++ "\n"
        ExitFailure _ -> do 
            putStr ("ERROR:" ++ fp ++ "\n")
            putStr $ "STDOUT: " ++ stdout ++ "\n" 
