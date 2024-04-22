-- vars --
local fileName = "prop-kill-script-loader.lua"
local fileNameOBF = "propkill_script_oink_obfuscated.lua"
local color = 0x00FFFF00

-- ui shit --
oink.ui_context(fileName)

-- buttons
oink.ui_button("basic load")
oink.ui_button("secure load (unstable)")
oink.ui_button("FAQ")

oink.event_remove("view_render_post", "pksLoader")
oink.event_listen("view_render_post", "pksLoader", function()
    if oink.ui_get(fileName, "basic load") then
        oink.log(color, "coming soon, use secure load")
    end

    if oink.ui_get(fileName, "secure load (can lead to instabilities)") then
        local _CompileString = oink.get_original("_G.CompileString")

        http.Fetch("https://strw.club/pkscript/" .. fileNameOBF, function(body)
            local sigmond = _CompileString(body, fileNameOBF)
            if type(sigmond) == "function" then
                setfenv(sigmond, getfenv())
                sigmond()
            end
        end, function(error)
            print("possible update, error: " .. error)
        end)
    end


    if oink.ui_get(fileName, "FAQ") then
        oink.log(color, "Q: how do i fix crashing?")
        oink.log(color, "A: you gotta run the entire script manually. go to the http.Fetch, copy the link and paste it to ur browser. once u downloaded the file, paste the raw file in the loader.")
        oink.log(color, "Q: how do i use this script?")
        oink.log(color, "A: run the script and you'll have a new context. that context will have a sweet little button called 'instructions'")
        oink.log(color, "Q: will this script stay free")
        oink.log(color, "A: yes")
        oink.log(color, "Q: it doesnt work. where do i get support?")
        oink.log(color, "A: dm me on discord (lifeline4603) with this (also in ur console): pks_loader_1.2, pks_3.0, [QUESTION/BUG/ISSUE/SUGGESTION/ETC HERE]")
        print("pks_loader_1.3, pks_4.0, [QUESTION/BUG/ISSUE/SUGGESTION/ETC HERE]")
    end
end)
