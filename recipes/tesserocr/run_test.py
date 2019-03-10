import locale

locale.setlocale(locale.LC_ALL, 'C')

import tesserocr

with tesserocr.PyTessBaseAPI() as api:
    api.Init(lang='eng')
