-- lazy.nvim
return {
	{
		"robitx/gp.nvim",
		config = function()
			local conf = {
				providers = {
					openai = {},

					copilot = {
						disable = false,
						endpoint = "https://api.githubcopilot.com/chat/completions",
						secret = {
							"bash",
							"-c",
							"cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
						},
					},

					ollama = {
						disable = true,
						endpoint = "http://localhost:11434/v1/chat/completions",
					},
				},
				-- For customization, refer to Install > Configuration in the Documentation/Readme
				agents = {
					{
						name = "DeepSeekV2",
						provider = "ollama",
						disable = false,
						chat = true,
						command = true,
						model = { model = "deepseek-coder-v2" },
						system_prompt = "You are an Typescript, React, coding master from Texas.",
					},
				},
			}
			require("gp").setup(conf)

			-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
			require("which-key").add({
				-- VISUAL mode mappings
				-- s, x, v modes are handled the same way by which_key
				{
					mode = { "v" },
					nowait = true,
					remap = false,
					{ "<C-g><C-t>", ":<C-u>'<,'>GpChatNew tabnew<cr>", desc = "ChatNew tabnew" },
					{ "<C-g><C-v>", ":<C-u>'<,'>GpChatNew vsplit<cr>", desc = "ChatNew vsplit" },
					{ "<C-g><C-x>", ":<C-u>'<,'>GpChatNew split<cr>", desc = "ChatNew split" },
					{ "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append (after)" },
					{ "<C-g>b", ":<C-u>'<,'>GpPrepend<cr>", desc = "Visual Prepend (before)" },
					{ "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", desc = "Visual Chat New" },
					{ "<C-g>g", group = "generate into new .." },
					{ "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew" },
					{ "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew" },
					{ "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup" },
					{ "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", desc = "Visual GpTabnew" },
					{ "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew" },
					{ "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection" },
					{ "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
					{ "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat Paste" },
					{ "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite" },
					{ "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
					{ "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", desc = "Visual Toggle Chat" },
					{ "<C-g>w", group = "Whisper" },
					{ "<C-g>wa", ":<C-u>'<,'>GpWhisperAppend<cr>", desc = "Whisper Append" },
					{ "<C-g>wb", ":<C-u>'<,'>GpWhisperPrepend<cr>", desc = "Whisper Prepend" },
					{ "<C-g>we", ":<C-u>'<,'>GpWhisperEnew<cr>", desc = "Whisper Enew" },
					{ "<C-g>wn", ":<C-u>'<,'>GpWhisperNew<cr>", desc = "Whisper New" },
					{ "<C-g>wp", ":<C-u>'<,'>GpWhisperPopup<cr>", desc = "Whisper Popup" },
					{ "<C-g>wr", ":<C-u>'<,'>GpWhisperRewrite<cr>", desc = "Whisper Rewrite" },
					{ "<C-g>wt", ":<C-u>'<,'>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
					{ "<C-g>wv", ":<C-u>'<,'>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
					{ "<C-g>ww", ":<C-u>'<,'>GpWhisper<cr>", desc = "Whisper" },
					{ "<C-g>x", ":<C-u>'<,'>GpContext<cr>", desc = "Visual GpContext" },
				},

				-- NORMAL mode mappings
				{
					mode = { "n" },
					nowait = true,
					remap = false,
					{ "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
					{ "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
					{ "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
					{ "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)" },
					{ "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
					{ "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
					{ "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
					{ "<C-g>g", group = "generate into new .." },
					{ "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew" },
					{ "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew" },
					{ "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup" },
					{ "<C-g>gt", "<cmd>GpTabnew<cr>", desc = "GpTabnew" },
					{ "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
					{ "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
					{ "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
					{ "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
					{ "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
					{ "<C-g>w", group = "Whisper" },
					{ "<C-g>wa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" },
					{ "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" },
					{ "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
					{ "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
					{ "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
					{ "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" },
					{ "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
					{ "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
					{ "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
					{ "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
				},

				-- INSERT mode mappings
				{
					mode = { "i" },
					nowait = true,
					remap = false,
					{ "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew" },
					{ "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit" },
					{ "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split" },
					{ "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)" },
					{ "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)" },
					{ "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat" },
					{ "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder" },
					{ "<C-g>g", group = "generate into new .." },
					{ "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew" },
					{ "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew" },
					{ "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup" },
					{ "<C-g>gt", "<cmd>GpTabnew<cr>", desc = "GpTabnew" },
					{ "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew" },
					{ "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent" },
					{ "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite" },
					{ "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop" },
					{ "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat" },
					{ "<C-g>w", group = "Whisper" },
					{ "<C-g>wa", "<cmd>GpWhisperAppend<cr>", desc = "Whisper Append (after)" },
					{ "<C-g>wb", "<cmd>GpWhisperPrepend<cr>", desc = "Whisper Prepend (before)" },
					{ "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew" },
					{ "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New" },
					{ "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup" },
					{ "<C-g>wr", "<cmd>GpWhisperRewrite<cr>", desc = "Whisper Inline Rewrite" },
					{ "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew" },
					{ "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew" },
					{ "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper" },
					{ "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext" },
				},
			})
		end,
	},
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		enabled = false,
		version = "0.0.9", -- set this if you want to always pull the latest change
		opts = {
			-- add any opts here
			provider = "copilot",
			auto_suggestions_provider = "copilot",
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
