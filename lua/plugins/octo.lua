local hi = require('utils.hi')
local li = require('utils.li')
local colors = require('colors')
local vars = require('vars')

-- highlights
hi('OctoBlue', colors.columbia_blue)
hi('OctoGreen', colors.mint_green)
hi('OctoRed', colors.brink_pink)
hi('OctoYellow', colors.gold)
hi('OctoNormalFront', colors.text0)
hi('OctoGrey', colors.biloba_flower)
hi('OctoPurple', colors.mauve)
hi('OctoBubbleDelimiterBlue', colors.columbia_blue)
hi('OctoBubbleDelimiterYellow', colors.gold)
hi('OctoBubbleDelimiterRed', colors.brink_pink)
hi('OctoBubbleDelimiterGreen', colors.mint_green)
hi('OctoBubbleBlue', colors.columbia_blue, nil, 'reverse')
hi('OctoBubbleYellow', colors.gold, nil, 'reverse')
hi('OctoBubblePurple', colors.mauve, nil, 'reverse')
hi('OctoBubbleRed', colors.brink_pink, nil, 'reverse')
hi('OctoBubbleGreen', colors.mint_green, nil, 'reverse')
hi('OctoFilePanelCounter', colors.aquamarine)
hi('OctoFilePanelTitle', colors.secondary)
hi('OctoViewer', colors.columbia_blue, nil, 'reverse')
li('OctoTimelineMarker', 'Identifier')
li('OctoTimelineItemHeading', 'Comment')
li('OctoStatusUntracked', 'OctoGreen')
li('OctoDate', 'Comment')
li('OctoStatusRenamed', 'OctoBlue')
li('OctoVertSplit', 'VertSplit')
li('OctoStateDismissed', 'OctoStateClosed')
li('OctoStateClosed', 'OctoRed')
li('OctoStateCommented', 'Normal')
li('OctoCursorLine', 'CursorLine')
li('OctoStateApproved', 'OctoStateOpen')
li('OctoStateOpen', 'OctoGreen')
li('OctoStatePending', 'OctoYellow')
li('OctoSignColumn', 'Normal')
li('OctoNormal', 'Normal')
li('OctoDiffstatNeutral', 'OctoGrey')
li('OctoDiffstatDeletions', 'OctoRed')
li('OctoStatusLine', 'StatusLine')
li('OctoStatusLineNC', 'StatusLineNC')
li('OctoFailingTest', 'OctoRed')
li('OctoPassingTest', 'OctoGreen')
li('OctoReactionViewer', 'OctoViewer')
li('OctoReaction', 'OctoBubble')
li('OctoBubble', 'NormalFloat')
li('OctoUserViewer', 'OctoViewer')
li('OctoUser', 'OctoBubble')
li('OctoEndOfBuffer', 'EndOfBuffer')
li('OctoMissingDetails', 'Comment')
li('OctoIssueId', 'Question')
li('OctoDetailsLabel', 'Title')
li('OctoStatusDeleted', 'OctoRed')
li('OctoSymbol', 'Comment')
li('OctoStatusUnknown', 'OctoYellow')
li('OctoEmpty', 'Comment')
li('OctoStatusTypeChange', 'OctoBlue')
li('OctoStatusCopied', 'OctoBlue')
li('OctoStatusUnmerged', 'OctoBlue')
li('OctoDiffstatAdditions', 'OctoGreen')
li('OctoStateMerged', 'OctoPurple')
li('OctoStateChangesRequested', 'OctoStateClosed')
li('OctoStateSubmitted', 'OctoBubbleGreen')
li('OctoIssueTitle', 'PreProc')
li('OctoStatusModified', 'OctoBlue')
li('OctoStatusAdded', 'OctoGreen')
li('OctoFilePanelPath', 'Comment')
li('OctoFilePanelFileName', 'NormalFront')
li('OctoStatusBroken', 'OctoRed')
li('OctoDetailsValue', 'Identifier')
li('OctoFloat', 'NormalFloat')
li('OctoEditable', 'NormalFloat')
li('OctoDirty', 'OctoRed')

require('octo').setup(vim.tbl_extend('error', {
  default_remote = { 'upstream', 'origin' },
  timeline_indent = '2',
  snippet_context_lines = 4,
  file_panel = { size = 10, use_icons = true }
}, vars.octo.symbols))