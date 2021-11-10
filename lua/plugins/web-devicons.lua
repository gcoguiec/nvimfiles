local colors = require('colors')
local set_icon = require('nvim-web-devicons').set_icon
local set_default_icon = require('nvim-web-devicons').set_default_icon

require('nvim-web-devicons').setup { override = {}, default = true }

set_default_icon('', colors.cornflower_blue)

local icons = {
  ['ts'] = { icon = 'ﯤ', color = colors.pelorous, name = 'Ts' },
  ['tsx'] = { icon = '', color = colors.shakespeare, name = 'Tsx' },
  ['tsconfig.json'] = {
    icon = '',
    color = colors.royal_blue,
    name = 'TsConfig'
  },
  ['markdown'] = {
    icon = '',
    color = colors.cornflower_blue,
    name = 'Markdown'
  },
  ['md'] = { icon = '', color = colors.cornflower_blue, name = 'Md' },
  ['yarn.lock'] = { icon = '', color = colors.pelorous, name = 'Yarn' },
  ['.prettierignore'] = {
    icon = 'P',
    color = colors.deep_cerise,
    name = 'PrettierIgnore'
  },
  ['.prettierrc'] = {
    icon = 'P',
    color = colors.deep_cerise,
    name = 'PrettierRc'
  },
  ['.nvmrc'] = { icon = '', color = colors.apple, name = 'NvmRc' },
  ['.npmrc'] = { icon = 'ﯵ', color = colors.mahogany, name = 'NpmRc' },
  ['LICENSE'] = { icon = '', color = colors.pumpkin, name = 'Licence' },
  ['LICENSE.md'] = { icon = '', color = colors.pumpkin, name = 'LicenceMd' },
  ['.eslintrc.json'] = {
    icon = '',
    color = colors.free_speech_blue,
    name = 'EslintRcJson'
  },
  ['.eslintrc.js'] = {
    icon = '',
    color = colors.free_speech_blue,
    name = 'EslintRcJs'
  },
  ['.eslintignore'] = {
    icon = '',
    color = colors.free_speech_blue,
    name = 'EslintIgnore'
  },
  ['.editorconfig'] = {
    icon = '',
    color = colors.white,
    name = 'EditorConfig'
  },
  ['.gitattributes'] = {
    icon = '',
    color = colors.cinnabar,
    name = 'GitAttributes'
  },
  ['.gitignore'] = { icon = '', color = colors.cinnabar, name = 'GitIgnore' },
  ['.gitconfig'] = { icon = '', color = colors.cinnabar, name = 'GitConfig' },
  ['.gitmodules'] = { icon = '', color = colors.cinnabar, name = 'GitModules' },
  ['COMMIT_EDITMSG'] = {
    icon = '',
    color = colors.cinnabar,
    name = 'GitCommit'
  },
  ['graphql'] = { icon = '', color = colors.deep_cerise, name = 'Graphql' },
  ['gql'] = { icon = '', color = colors.deep_cerise, name = 'Gql' },
  ['js'] = { icon = '', color = colors.gold, name = 'Js' },
  ['jsconfig.json'] = { icon = '', color = colors.gold, name = 'JsConfig' },
  ['js.map'] = { icon = '', color = colors.gold, name = 'JsMap' },
  ['html'] = { icon = '', color = colors.cinnabar, name = 'Html' },
  ['css'] = { icon = '', color = colors.pelorous, name = 'Css' },
  ['css.map'] = { icon = '', color = colors.pelorous, name = 'CssMap' },
  ['png'] = { icon = ' ', color = colors.medium_orchid, name = 'Png' },
  ['jpg'] = { icon = ' ', color = colors.medium_orchid, name = 'Jpg' },
  ['jpeg'] = { icon = ' ', color = colors.medium_orchid, name = 'Jpeg' },
  ['webp'] = { icon = ' ', color = colors.pelorous, name = 'Webp' },
  ['sketch'] = { icon = '', color = colors.golden_poppy, name = 'Sketch' },
  ['java'] = { icon = '', color = colors.mahogany, name = 'Java' },
  ['class'] = { icon = '', color = colors.royal_blue, name = 'JavaClass' },
  ['jar'] = { icon = '', color = colors.golden_poppy, name = 'Jar' },
  ['sql'] = { icon = '', color = colors.gold, name = 'Sql' },
  ['pdf'] = { icon = '', color = colors.cinnabar, name = 'Pdf' },
  ['nuxt.config.js'] = {
    icon = '喝',
    color = colors.mountain_meadow,
    name = 'NuxtConfigJs'
  },
  ['nuxt.config.ts'] = {
    icon = '喝',
    color = colors.mountain_meadow,
    name = 'NuxtConfigTs'
  },
  ['snowpack.config.js'] = {
    icon = '喝',
    color = colors.white,
    name = 'SnowpackConfigJs'
  },
  ['snowpack.config.ts'] = {
    icon = '喝',
    color = colors.white,
    name = 'SnowpackConfigTs'
  },
  ['stryker.conf.js'] = {
    icon = '什',
    color = colors.cinnabar,
    name = 'StrykerConfigJs'
  },
  ['stryker.conf.ts'] = {
    icon = '什',
    color = colors.cinnabar,
    name = 'StrykerConfigTs'
  },
  ['.stylelintrc.js'] = {
    icon = '',
    color = colors.mauve,
    name = 'StylelintJs'
  },
  ['.stylelintignore'] = {
    icon = '',
    color = colors.pelorous,
    name = 'StylelintIgnore'
  },
  ['diff'] = { icon = '署', color = colors.royal_blue, name = 'Diff' },
  ['AndroidManifest.xml'] = {
    icon = '',
    color = colors.mantis,
    name = 'AndroidManifest'
  },
  ['JenkinsFile'] = {
    icon = '',
    color = colors.royal_blue,
    name = 'Jenkinsfile'
  },
  ['stories.js'] = {
    icon = 'S',
    color = colors.violet_red,
    name = 'StorybookStoryJs'
  },
  ['stories.ts'] = {
    icon = 'S',
    color = colors.violet_red,
    name = 'StorybookStoryTs'
  },
  ['mdx'] = { icon = '', color = colors.gold, name = 'Mdx' },
  ['Dockerfile'] = { icon = '', color = colors.pelorous, name = 'Dockerfile' },
  ['Dockerfile.dev'] = {
    icon = '',
    color = colors.pelorous,
    name = 'Dockerfile'
  },
  ['Dockerfile.staging'] = {
    icon = '',
    color = colors.pelorous,
    name = 'Dockerfile'
  },
  ['Dockerfile.prod'] = {
    icon = '',
    color = colors.pelorous,
    name = 'Dockerfile'
  },
  ['svelte'] = { icon = '', color = colors.orange_red, name = 'Svelte' },
  ['key'] = { icon = '', color = colors.niagara, name = 'Key' },
  ['secret'] = { icon = '', color = colors.niagara, name = 'Secret' },
  ['svg'] = { icon = 'ﰟ', color = colors.supernova, name = 'Svg' },
  ['.svgo.yml'] = { icon = '', color = colors.royal_blue, name = 'Svgo' },
  ['prisma'] = { icon = '喝', color = colors.light_sea_green, name = 'Prisma' },
  ['erl'] = { icon = '', color = colors.cinnabar, name = 'Erl' },
  ['tf'] = { icon = 'T', color = colors.havelock_blue, name = 'Terraform' },
  ['lock'] = { icon = '', color = colors.gold, name = 'Lock' },
  ['py'] = { icon = '', color = colors.lochmara, name = 'Py' },
  ['pyc'] = { icon = '', color = colors.shakespeare, name = 'Pyc' },
  ['pyd'] = { icon = '', color = colors.shakespeare, name = 'Pyd' },
  ['pyo'] = { icon = '', color = colors.shakespeare, name = 'Pyo' },
  ['babel.config.json'] = {
    icon = 'B',
    color = colors.gold,
    name = 'BabelConfig'
  },
  ['.babelrc.json'] = { icon = 'B', color = colors.gold, name = 'babelRc' },
  ['woff'] = { icon = '', color = colors.cinnabar, name = 'Woff' },
  ['woff2'] = { icon = '', color = colors.cinnabar, name = 'Woff2' },
  ['lua'] = { icon = '', color = colors.maya_blue, name = 'Lua' },
  ['.luacheckrc'] = {
    icon = '',
    color = colors.maya_blue,
    name = 'LuaCheckRc'
  },
  ['.lua-format'] = {
    icon = '',
    color = colors.golden_poppy,
    name = 'LuaFormat'
  },
  ['rockspec'] = { icon = '', color = colors.royal_blue, name = 'Rockspec' },
  ['Makefile'] = { icon = 'ﬓ', color = colors.cinnabar, name = 'Makefile' },
  ['Gemfile$'] = { icon = '', color = colors.cinnabar, name = 'Gemfile' },
  ['README'] = { icon = '', color = colors.cornflower_blue, name = 'Readme' },
  ['README.md'] = {
    icon = '',
    color = colors.cornflower_blue,
    name = 'ReadmeMd'
  },
  ['c'] = { icon = '', color = colors.maya_blue, name = 'C' },
  ['h'] = { icon = '', color = colors.royal_blue, name = 'H' },
  ['go'] = { icon = '', color = colors.shakespeare, name = 'Go' },
  ['mod'] = { icon = '', color = colors.dark_pink, name = 'GoMod' },
  ['sv'] = { icon = '﬙', color = colors.cinnabar, name = 'SystemVerilog' },
  ['v'] = { icon = '﬙', color = colors.cinnabar, name = 'Verilog' },
  ['vhd'] = { icon = '﬙', color = colors.cinnabar, name = 'VHDL' },
  ['CHANGELOG'] = { icon = '', color = colors.royal_blue, name = 'Changelog' },
  ['CHANGELOG.md'] = {
    icon = '',
    color = colors.royal_blue,
    name = 'ChangelogMd'
  },
  ['vite.config.js'] = { icon = '', color = colors.gold, name = 'Vite' },
  ['robots.txt'] = { icon = 'ﮧ', color = colors.cinnabar, name = 'Robots' },
  ['vue'] = { icon = '﵂', color = colors.medium_sea_green, name = 'Vue' },
  ['rs'] = { icon = '', color = colors.tomato, name = 'Rs' },
  ['Cargo.toml'] = { icon = '', color = colors.golden_poppy, name = 'Cargo' },
  ['nix'] = { icon = '', color = colors.havelock_blue, name = 'Nix' },
  ['zig'] = { icon = '', color = colors.gold, name = 'Zig' },
  ['webpack'] = { icon = 'ﰩ', color = colors.shakespeare, name = 'Webpack' },
  ['rb'] = { icon = '', color = colors.cinnabar, name = 'Rb' },
  ['scss'] = { icon = '', color = colors.french_rose, name = 'Scss' },
  ['swift'] = { icon = '', color = colors.west_side, name = 'Swift' },
  ['toml'] = { icon = '', color = colors.light_sea_green, name = 'Toml' },
  ['yml'] = { icon = '', color = colors.light_sea_green, name = 'Yml' },
  ['log'] = { icon = '', color = colors.pelorous, name = 'Log' },
  ['json'] = { icon = 'ﬥ', color = colors.gold, name = 'Json' },
  ['.butlerci.json5'] = {
    icon = 'B',
    color = colors.golden_poppy,
    name = 'Butler'
  }
}

for key, icon in pairs(icons) do set_icon { [key] = icon } end
