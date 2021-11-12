.EXPORT_ALL_VARIABLES:

_FIND_ARGS := -type f -name '*.lua' -not -path '*plugin/packer_compiled.lua' \
	-not -path '*.luarocks/*' -not -path '*.install/*' -print0
_PACKER_PREAMBULE := -c 'autocmd User PackerComplete quitall'
_TS_PARSER_LIST := comment c dockerfile elixir erlang go graphql hcl java javascript\
	json5 julia kotlin llvm nix python ruby r rust scss svelte swift toml tsx typescript\
	verilog vue yaml zig
_LSP_INSTALLER_LIST := dockerls elixirls terraformls yamlls eslint zls graphql\
	html svelte clangd rust_analyzer@nightly sumneko_lua denols stylelint_lsp\
	volar

all: help

ci: fmt_check lint

.PHONY: install
install: ## Download the plugins, parsers and LSP servers.
	nvim --headless $(_PACKER_PREAMBULE) -c 'PackerSync'
	nvim --headless -c 'TSInstall! $(_TS_PARSER_LIST)'
	nvim --headless -c 'LspInstall $(_LSP_INSTALLER_LIST)'

.PHONY: dev_install
dev_install: ## Install the development tools.
	luarocks install luacheck
	luarocks install --server=https://luarocks.org/dev luaformatter

.PHONY: update
update: ## Update the plugins and parsers.
	nvim --headless $(_PACKER_PREAMBULE) -c 'PackerUpdate'
	nvim --headless -c 'TSUpdate $(_TS_PARSER_LIST)'

.PHONY: link
link: ## Link the project.
	ln -sf $(PWD) $(HOME)/.config/nvim

.PHONY: unlink
unlink: ## Unlink the project.
	unlink $(HOME)/.config/nvim

.PHONY: fmt
fmt: ## Reformat the code-base.
	@find . $(_FIND_ARGS) | xargs -0 -n1 lua-format -i

.PHONY: fmt_check
fmt_check:
	find . $(_FIND_ARGS) | xargs -0 -n1 lua-format --check

.PHONY: lint
lint: ## Lint the code-base.
	@luacheck lua init.lua

.PHONY: test
test: ## Run the tests.
	@nvim --headless -u scripts/test_init.vim\
		-c "PlenaryBustedDirectory lua/tests/utils { minimal_init = './scripts/test_init.vim' }"

.PHONY: clean
clean: ## Remove the plugins, parsers and LSP servers.
	rm -f plugin/packer_compiled.lua
	rm -fr $(HOME)/.local/share/nvim/{site/pack,lsp_servers,tree-sitter*}

help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##";} /^[$$()% 0-9a-zA-Z_-]+:.*?##/ \
		{printf "  %-15s %s\n", $$1, $$2} /^##@/ {printf "\n%s\n", substr($$0, 5)} ' \
		$(MAKEFILE_LIST)
