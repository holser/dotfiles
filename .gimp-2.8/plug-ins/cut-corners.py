#!/usr/bin/env python
#vim: tabstop=4 shiftwidth=4 softtabstop=4
#vim: fileencoding=utf-8

from gimpfu import *

def python_fu_cut_corners(image, drawable, radius, top):
    pdb.gimp_context_push()
    pdb.gimp_image_set_active_layer(image, drawable)
    pdb.gimp_image_undo_group_start(image)

    pdb.gimp_layer_add_alpha(drawable)
    width=pdb.gimp_image_width(image)
    height=pdb.gimp_image_height(image)
    pdb.gimp_round_rect_select(image, 0, 0, width, height, radius, radius, CHANNEL_OP_REPLACE, True, False, 0, 0)
    pdb.gimp_selection_invert(image)
    if top:
        pdb.gimp_rect_select(image, 0, (height - radius), width, radius, CHANNEL_OP_SUBTRACT, False, 0)

    pdb.gimp_edit_clear(drawable)
    pdb.gimp_selection_none(image)

    pdb.gimp_image_undo_group_end(image)
    pdb.gimp_displays_flush()
    pdb.gimp_context_pop()
    return

register(
        "python_fu_cut_corners",
        "Cut Corners",
        "Script makes very nice round corners on screenshort",
        "Golovatiuk Sergii",
        "Golovatiuk Sergii",
        "2013/07/28",
        "Cut Corners",
        "RGB*",
        [
            (PF_IMAGE, "image", "Input Image", None),
            (PF_DRAWABLE, "drawable", "Input Drawable", None),
            (PF_SPINNER, "radius", "Radius (0-20 pixels)", 10, (0, 20, 1)),
            (PF_TOGGLE, "top", "Only Top", 0),
        ],
        [],
        python_fu_cut_corners,
        menu="<Image>/Filters/Python-Fu")

main()
