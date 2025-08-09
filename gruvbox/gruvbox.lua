function round(n)
    return math.floor(n + 0.5)
end
local palette = {
    dark0_hard     = {9,32,33},
    dark0          = {0,40,40},
    dark0_soft     = {0,48,47},
    dark1          = {0,56,54},
    dark2          = {0,73,69},
    dark3          = {02,92,84},
    dark4          = {24,111,100},
    dark4_256      = {24,111,100},

    gray_245       = {46,131,116},
    gray_244       = {46,131,116},

    light0_hard    = {49,245,215},
    light0         = {53,244,193},
    light0_soft    = {42,229,188},
    light1         = {35,219,178},
    light2         = {13,196,161},
    light3         = {89,174,147},
    light4         = {68,153,132},
    light4_256     = {68,153,132},

    bright_red     = {51,73,52},
    bright_green   = {84,187,38},
    bright_yellow  = {50,189,47},
    bright_blue    = {31,165,152},
    bright_purple  = {11,134,155},
    bright_aqua    = {42,192,124},
    bright_orange  = {54,128,25},

    neutral_red    = {04,36,29},
    neutral_green  = {52,151,26},
    neutral_yellow = {15,153,33},
    neutral_blue   = {9,133,136},
    neutral_purple = {77,98,134},
    neutral_aqua   = {04,157,106},
    neutral_orange = {14,93,14},

    faded_red      = {57,0,6},
    faded_green    = {21,116,14},
    faded_yellow   = {81,118,20},
    faded_blue     = {7,102,120},
    faded_purple   = {43,63,113},
    faded_aqua     = {6,123,88},
    faded_orange   = {75,58,3},
}

for k, v in pairs(palette) do
    local r, g, b = unpack(v)
    r = round(5*r/255)
    g = round(5*g/255)
    b = round(5*b/255)
    print(k .. ': rgb' .. tostring(r) .. tostring(g) .. tostring(b))
end

return palette
