#!/usr/bin/env python
#vim: tabstop=4 shiftwidth=4 softtabstop=4
#vim: fileencoding=utf-8

from gimpfu import *

def python_fu_drop_shadow(image, drawable):
    pdb.gimp_context_push()
    pdb.gimp_image_set_active_layer(image, drawable)
    pdb.gimp_image_undo_group_start(image)

    #Adding shadow
    pdb.script_fu_drop_shadow(image, drawable, 3, 4, 10, (0, 0, 0), 40.0, True)

    pdb.gimp_image_undo_group_end(image)
    pdb.gimp_displays_flush()
    pdb.gimp_context_pop()
    return

register(
        "python_fu_drop_shadow",
        "Drop Shadow",
        "Script makes very nice shadow for screenshort",
        "Sergii Golovatiuk",
        "Sergii Golovatiuk",
        "2013/07/28",
        "Drop Shadow",
        "RGB*",
        [
            (PF_IMAGE, "image", "Input Image", None), #Pointer to image
            (PF_DRAWABLE, "drawable", "Input drawable", None) # Pointer to default layer
        ],
        [],
        python_fu_drop_shadow,
        menu="<Image>/Filters/Python-Fu")

main()
