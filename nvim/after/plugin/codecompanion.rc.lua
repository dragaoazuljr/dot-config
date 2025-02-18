local status, codecompanion = pcall(require, 'codecompanion')
if (not status) then return end

codecompanion.setup({
	adapters = {
		deekseekCoder = function()
			return require("codecompanion.adapters").extend("ollama", {
				name = "deepseekCoder",
				env = {
					url = "http://192.168.0.14:11434",
					api_key = "key"
				},
				headers = {
          ["Content-Type"] = "application/json",
          ["Authorization"] = "Bearer ${api_key}",
        },
        parameters = {
          sync = true,
        },
				schema = {
					model = {
						default = "deepseek-coder-v2:16b-lite-base-q4_K_M"
					},
					num_ctx = {
						default = 4096,
					},
					num_predict = {
						default = -1
					}
				}
			})
		end,
		deekseekR1 = function()
			return require("codecompanion.adapters").extend("ollama", {
				name = "deepseekR1",
				env = {
					url = "http://192.168.0.14:11434",
					api_key = "key"
				},
				headers = {
          ["Content-Type"] = "application/json",
          ["Authorization"] = "Bearer ${api_key}",
        },
        parameters = {
          sync = true,
        },
				schema = {
					model = {
						default = "deepseek-r1:7b"
					},
					num_ctx = {
						default = 8092,
					},
					num_predict = {
						default = -1
					}
				}
			})
		end,
	},
	strategies = {
		chat = {
			adapter = "deekseekR1",
		},
		inline = {
			adapter = "deekseekCoder"
		}
	}
})
