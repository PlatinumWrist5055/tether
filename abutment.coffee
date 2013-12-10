$ = jQuery

Tether.modules.push
  position: ({top, left}) ->
    # TODO: Just do this in tether, so we don't have to repeat it
    height = @$element.outerHeight()
    width = @$element.outerWidth()
    targetHeight = @$target.outerHeight()
    targetWidth = @$target.outerWidth()

    targetPos = @$target.offset()
    targetPos.bottom = targetPos.top + targetHeight
    targetPos.right = targetPos.left + targetWidth

    bottom = top + height
    right = left + width

    abutted = []
    if top <= targetPos.bottom and bottom >= targetPos.top
      for side in ['left', 'right']
        if targetPos[side] in [left, right]
          abutted.push side

    if left <= targetPos.right and right >= targetPos.left
      for side in ['top', 'bottom']
        if targetPos[side] in [top, bottom]
          abutted.push side

    sides = ['left', 'top', 'right', 'bottom']
    for side in sides
      @removeClass "tether-abutted-#{ side }"

    for side in abutted
      @addClass "tether-abutted-#{ side }"

    true