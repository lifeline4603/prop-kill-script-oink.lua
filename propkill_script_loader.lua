-- Variables --
local fileName = "prop-kill-script-loader.lua"
local fileNameOBF = "prop-kill-script-loader-obfuscated.lua"
local color = 0x00FFFF00

-- UI Shit --
oink.ui_context(fileName)

-- Buttons
oink.ui_button("basic load")
oink.ui_button("secure load (unstable)")
oink.ui_button("FAQ")

oink.event_remove("view_render_post", "pksLoader")
oink.event_listen("view_render_post", "pksLoader", function()
    if oink.ui_get(fileName, "basic load") then
        oink.log(color, "runstring error, use secure load.")
    end

    if oink.ui_get(fileName, "secure load (unstable)") then
        local _CompileString = oink.get_original("_G.CompileString")

        http.Fetch("https://strw.club/" .. fileNameOBF, function(body)
            local sigmond = _CompileString(body, fileNameOBF)
            if type(sigmond) == "function" then
                setfenv(sigmond, getfenv())
                sigmond()
            end
        end, function(error)
            print("Possible update, error: " .. error)
        end)
    end


    if oink.ui_get(fileName, "FAQ") then
        oink.log(color, "Q: How do i fix crashing?")
        oink.log(color,
            "A: You gotta run the entire script manually. go to the http.Fetch, copy the link and paste it to ur browser. once u downloaded the file, paste the raw file in the loader.")
        oink.log(color, "Q: How do i use this script?")
        oink.log(color,
            "A: Run the script and you'll have a new context. that context will have a sweet little button called 'instructions'")
        oink.log(color, "Q: Will this script stay free")
        oink.log(color, "A: Yes")
        oink.log(color, "Q: It doesnt work. where do i get support?")
        oink.log(color,
            "A: Dm me on discord (lifeline4603) with this (also in ur console): pks_loader_1.1, pks_3.0, [QUESTION/BUG/ISSUE/SUGGESTION/ETC HERE]")
        print("pks_loader_1.1, pks_3.0, [QUESTION/BUG/ISSUE/SUGGESTION/ETC HERE]")
    end
end)
