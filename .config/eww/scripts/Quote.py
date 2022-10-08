#from brainyquote_api import quote

from statistics import quantiles
from pybrainyquote import *

Quote.today(topic="Love")
Quote_tosee=Quote.today().content
author=Quote.today().author
#print(repr(Quote_tosee))
Quoteasis = Quote_tosee.replace("\n","")
#print(Quote_tosee.replace("\n",""))
author = author.replace("\n","")

#if len(Quote_tosee) > 20 :
#print(Quoteasis)
#Quoteasis = "Life before death, strength before weakness, journey before destination."
#print(len(Quoteasis))
Orig_Quote = Quoteasis
if len(Quoteasis) > 51:
    Quoteasis = "  "+Quoteasis[0:51]+"...  "
    #print(Quoteasis)
else:
    Quoteasis = "  "+Quoteasis+"...  "



print("(Quote_of_day :q \""+Quoteasis+ "\" :author \"" + author +"\" )")