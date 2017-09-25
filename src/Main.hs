
module Main where

import STFT

main :: IO ()
main = do 
  (fs, audio) <- readWav "singing-female.wav"
  let winsz = 511
      hopsz = 256
      fftsz = 1024
      window = hammingC winsz
      anal = stft audio window fftsz hopsz
      synth = stftSynth anal hopsz winsz 
  writeWav synth fs "output.wav"

