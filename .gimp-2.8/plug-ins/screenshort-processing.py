#!/usr/bin/env python
#vim: tabstop=4 shiftwidth=4 softtabstop=4
#vim: fileencoding=utf-8

from gimpfu import *

def python_fu_screenshot(image, drawable, cut_corners, radius, top, ampl_factor, reverse_phase):
    pdb.gimp_context_push()
    pdb.gimp_image_set_active_layer(image, drawable)
    pdb.gimp_image_undo_group_start(image)

    if cut_corners:
        selection_channel = pdb.gimp_selection_save(image)
        cropping_required = pdb.gimp_selection_bounds(image)
        pdb.python_fu_cut_corners(image, drawable, radius, top)

    if cropping_required and cut_corners:
        pdb.gimp_selection_load(selection_channel)
    pdb.python_fu_wave_crop(image, drawable, ampl_factor, reverse_phase)

    pdb.python_fu_drop_shadow(image, drawable)

    pdb.gimp_image_undo_group_end(image)
    pdb.gimp_displays_flush()
    pdb.gimp_context_push()
    return

register(
        "python_fu_screenshot",
        "ScreenShot processing",
        "Script process all filters together",
        "Sergii Golovatiuk",
        "Sergii Golovatiuk",
        "2013/07/28",
        "ScreenShot processing",
        "RGB*",
        [
            (PF_IMAGE, "image", "Input Image", None),
            (PF_DRAWABLE, "drawable", "Input Drawable", None),
            (PF_TOGGLE, "cut_corners", "Remove corners", 0),
            (PF_SPINNER, "radius", "Radius (0-20)", 10, (0, 20, 1)),
            (PF_TOGGLE, "top", "Only top", 0),
            (PF_SPINNER, "ampl_factor", "Wave Power (0 - stil, 10 - tsunami)", 3, (0, 10, 0)),
            (PF_TOGGLE, "reverse_phase", "Backphase", False)
        ],
        [],
        python_fu_screenshot,
        menu="<Image>/Filters/Python-Fu")

main()
