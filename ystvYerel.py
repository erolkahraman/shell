# -*- coding: UTF-8 -*-
from yerelkayit import *
import sys
import os
ANALIZ_DIZIN  = "/depo/analiz"
AKTARIM_DIZIN = "/depo/database"
OZET_DIZIN    = "/depo/ozet"
WEB_DIZIN     = "/yayin"
MERKEZ        = "http://depoys.skaas.net/dhys.php"
TIP           = "yerel"
  
if len(sys.argv) > 1:
  mp4_file = sys.argv[1]
  info_file = mp4_file[:-3] + "info"
  print("os.remove(\"%s\")" % mp4_file)
  print("os.remove(\"%s\")" % info_file)
  os.remove(mp4_file)
  os.remove(info_file)
  #ds = yerelKayit(sys.argv[1],ANALIZ_DIZIN, AKTARIM_DIZIN, OZET_DIZIN, WEB_DIZIN, MERKEZ, TIP)
