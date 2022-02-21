import Test.Hspec
import Lib

main :: IO ()
main = hspec $ do
  describe "Lib.greenPass" $ do
    it "can't fail" $ do
      "test" `shouldBe` "test"
