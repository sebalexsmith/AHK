#Include C:\Users\sebal\OneDrive\Dokumenter\Personal\AHK\Utils.ahk




; Hotstrings for importing Python packages
::np<::

    returnString("import numpy as np")

return

::pd<::

    returnString("import pandas as pd")

return

::plt<::

    returnString("import matplotlib.pyplot as plt")

return

::rd<::

    returnString("import random as rd")

return

::imports<::

    returnString("import numpy as np`nimport pandas as pd`nimport matplotlib.pyplot as plt")

return




; Other Python helpers
::show<::

    returnString("plt.show()")

return

::fas<::

    returnString("fig, ax = plt.subplots()`n`nplt.show()")
    Sleep 100
    Send {Up}{Left 2}

return

::main<::

    returnString("def main() -> None:`n`n`nif __name__ == '__main__':`n`tmain()")
    Sleep 100
    Send {Up 3}{Tab}

return






































