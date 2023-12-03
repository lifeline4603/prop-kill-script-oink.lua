oink.ui_context("prop-kill-script-loader.lua")

oink.ui_button("basic load")
oink.ui_button("secure load (unstable)")
oink.ui_button("FAQ")

oink.event_remove("view_render_post", "pksLoader")
oink.event_listen("view_render_post", "pksLoader", function()

	if oink.ui_get("prop-kill-script-loader.lua", "basic load") then
		oink.log(0x00FFFF00, "runstring error, use secure load.")
	end

	if oink.ui_get("prop-kill-script-loader.lua", "secure load (unstable)") then
		local _CompileString = oink.get_original("_G.CompileString")

		http.Fetch("https://strw.club/propkill_script_oink_obfuscated.lua", function(body) -- thank you shabeel for uploading this to ur website much kisses mmmm
        		local sigmond = _CompileString(body, "propkill_script_oink_obfuscated.lua")
        		if type(sigmond) == "function" then
            			setfenv(sigmond, getfenv())
            			sigmond()
        		end
    		end, function(error)
        		print("possible update, error: " .. error)
    		end)
	end


	if oink.ui_get("prop-kill-script-loader.lua", "FAQ") then
		oink.log(0x00FFFF00, "Q: how do i fix crashing?")
		oink.log(0x00FFFF00, "A: you gotta run the entire script manually. go to the http.Fetch, copy the link and paste it to ur browser. once u downloaded the file, paste the raw file in the loader.")
		oink.log(0x00FFFF00, "Q: how do i use this script?")
		oink.log(0x00FFFF00, "A: run the script and you'll have a new context. that context will have a sweet little button called 'instructions'")
		oink.log(0x00FFFF00, "Q: will this script stay free")
		oink.log(0x00FFFF00, "A: yes")
		oink.log(0x00FFFF00, "Q: it doesnt work. where do i get support?")
		oink.log(0x00FFFF00, "A: dm me on discord (lifeline4603) with this (also in ur console): pks_loader_1.1, pks_3.0, [QUESTION/BUG/ISSUE/SUGGESTION/ETC HERE]")
		print("pks_loader_1.1, pks_3.0, [QUESTION/BUG/ISSUE/SUGGESTION/ETC HERE]")
	end
end)
