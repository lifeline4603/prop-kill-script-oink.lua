oink.ui_context("prop-kill-script-loader.lua")

oink.ui_button("basic load")
oink.ui_button("secure load (unstable)")
oink.ui_button("FAQ")

oink.event_remove("view_render_post", "pksLoader")
oink.event_listen("view_render_post", "pksLoader", function()

	if oink.ui_get("prop-kill-script-loader.lua", "basic load") then
		oink.log(0x00FFFF00, "fuck gmod, use secure load instead")
	end

	if oink.ui_get("prop-kill-script-loader.lua", "secure load (unstable)") then
		local _CompileString = oink.get_original("_G.CompileString")

		http.Fetch("https://shabeelisthegoat.xyz/propkill_script_script_loader.lua", -- thank you shabeel for uploading this to ur website much kisses mmmm
    		function(body)
        	local sigmond = _CompileString(body, "propkill_script_script_loader.lua")
        	if type(sigmond) == "function" then
            	setfenv(sigmond, getfenv())
            	sigmond()
        	end
    	end,
    	function(error)
        	print("POSSIBLE UPDATE, ASK LIFELINE or Error fetching Lua script: " .. error)
    	end
	)
	end


	if oink.ui_get("prop-kill-script-loader.lua", "FAQ") then
		oink.log(0x00FFFF00, "Q: how do i fix crashing?")
		oink.log(0x00FFFF00, "A: you gotta run the entire script manually. go to the http.Fetch, copy the link and paste it to ur browser. once u downloaded the file, paste the raw file in the loader.")
		oink.log(0x00FFFF00, "Q: how do i use this script?")
		oink.log(0x00FFFF00, "A: run the script and you'll have a new context. that context will have a sweet little button called 'instructions'")
		oink.log(0x00FFFF00, "Q: will this script stay free")
		oink.log(0x00FFFF00, "A: yes")
		oink.log(0x00FFFF00, "Q: it doesnt work. where do i get support?")
		oink.log(0x00FFFF00, "A: dm me on discord (lifeline4603) with this (also in ur console): pks_loader_1.0, pks_2.2, [QUESTION/BUG/ISSUE/SUGGESTION/ETC HERE]")
		print("pks_loader_1.0, pks_2.2, [QUESTION/BUG/ISSUE/SUGGESTION/ETC HERE]")
	end
end)