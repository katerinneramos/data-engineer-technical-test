# Data Engineer Technical Test
## Exercises 1
##### Implement the "annograms" function that uses the WORD.LST file to return anagrams of the word given in the "word" parameter.

def annograms(word): <br>
   #Write your code here. <br>
   words = [w.rstrip() for w in open('WORD.LST')]<br>
   raise NotImplementedError<br>
if __name__ == "__main__":<br>
   print(annograms("train"))<br>
   print('--')<br>
   print(annograms('drive'))<br>
   print('--')<br>
   print(annograms('python'))<br>