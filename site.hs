--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import           Text.Pandoc.Options

-- a comment
type Foo = String
data Bar = Bar { getBar :: Foo }

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "js/*.js" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*.css" $ do
        route   idRoute
        compile compressCssCompiler

    match "css/*.less" $ do
        route   $ setExtension "css"
        compile $ getResourceString >>= withItemBody (unixFilter "lessc" ["-"])

    match "pages/*" $ do
        route   $ gsubRoute "pages/" (const "") `composeRoutes` setExtension "html"
        compile $ pandocCompilerWith defaultHakyllReaderOptions pandocOptions
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    match "templates/*" $ compile templateCompiler

    match "components/jquery/dist/**" $ do
        route   $ gsubRoute "components/jquery/dist/" (const "js/")
        compile copyFileCompiler

    match "components/bootstrap/dist/**" $ do
        route   $ gsubRoute "components/bootstrap/dist/" (const "")
        compile copyFileCompiler

--------------------------------------------------------------------------------
pandocOptions :: WriterOptions
pandocOptions = defaultHakyllWriterOptions
    { writerHTMLMathMethod = MathJax "js/vendor/MathJax.js"
    , writerHtml5 = True }

postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

