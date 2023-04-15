namespace viewerlog

include std\graphics.e
include std\console.e

sequence currentColor = console:get_screen_char(1, 1, 1)

public procedure TextError(sequence Text)
    bk_color(RED)
    text_color(BLACK)
    puts(1, Text)
    
    bk_color(currentColor[1])
    text_color(currentColor[2])
end procedure

public procedure TextSuccess(sequence Text)
    bk_color(GREEN)
    text_color(BLACK)
    puts(1, Text)
    
    bk_color(currentColor[1])
    text_color(currentColor[2])
end procedure
