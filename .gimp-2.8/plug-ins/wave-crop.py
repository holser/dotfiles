#!/usr/bin/env python
#vim: tabstop=4 shiftwidth=4 softtabstop=4
#vim: fileencoding=utf-8

from gimpfu import *
import math

def python_fu_wave_crop(image, drawable, ampl_factor, reverse_phase):
    is_select, x1, y1, x2, y2 = pdb.gimp_selection_bounds(image)
    if not is_select: 
        pdb.gimp_message("Area is not selected")
        return

    if x1 == 0 and y1 == 0 and x2 == image.width and y2 == image.height:
        pdb.gimp_message("All image selected")
        return

    pdb.gimp_context_push()
    pdb.gimp_image_set_active_layer(image, drawable)
    pdb.gimp_image_undo_group_start(image)

    points = [ x1, y1, x2, y1 ]
    x = x2
    i = 4
    while x > x1:
        y = y2 + math.sin(x*0.01) * 5 
        points.append(x)
        points.append(y)
        x = x - 1
        i = i + 2
    pdb.gimp_free_select(image, i, points, CHANNEL_OP_REPLACE, True, False, 0)
    pdb.gimp_selection_invert(image)
    pdb.gimp_layer_add_alpha(drawable)
    pdb.gimp_edit_clear(drawable)
    pdb.gimp_selection_none(image)
    pdb.plug_in_autocrop(image,drawable)
    

    pdb.gimp_image_undo_group_end(image)
    pdb.gimp_displays_flush()
    pdb.gimp_context_pop()
    return

register(
        "python_fu_wave_crop",
        "Wave Crop",
        "Cropping image with wave effect over current selection.",
        "Golovatiuk Sergii <holser@gmail.com>",
        "Golovatiuk Sergii",
        "2013/11/1128",
        "Wave Crop",
        "RGB*",
        [
            (PF_IMAGE, "image", "Input Image", None), #Pointer to image
            (PF_DRAWABLE, "drawable", "Input drawable", None), # Pointer to default layer
            (PF_SPINNER, "ampl_factor", "Wave amplification (0 - still, 10 - tsunami)", 3, (0, 10, 1)),
            (PF_TOGGLE, "reverse_phase", "Reverse phase", 0)
        ],
        [],
        python_fu_wave_crop,
        menu="<Image>/Filters/Python-Fu")

main()
