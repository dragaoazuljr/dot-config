local status, llm = pcall(require, 'llm') 
if (not status) then return end

-- llm.setup({
-- 	backend = "ollama",
-- 	model = "codeqwen:code",
-- 	--model = "deepseek-coder-v2:16b-lite-base-q4_0",
-- 	context_window = 8192,
-- 	enable_suggestions_on_startup = true,
--   enable_suggestions_on_files = "*",
-- 	url = "http://localhost:11434",
-- 	debounce_ms = 500,
--   accept_keymap = "<C-Tab>",
--   dismiss_keymap = "<S-Tab>",
-- 	fim = {
--     enabled = true,
-- 		prefix = "<｜fim▁begin｜>",
--     middle = "<｜fim▁end｜>",
--     suffix = "<｜fim▁hole｜>",
-- 		-- prefix = "<fim_prefix>",
--     -- middle = "<fim_middle>",
--     -- suffix = "<fim_suffix>",
--   },	
-- 	request_body = {
-- 		options = {
-- 			num_predict = 60,
-- 			temperature = 0.9,
-- 			top_p = 0.95,
-- 		}
--   },
-- })

