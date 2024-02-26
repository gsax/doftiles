---@diagnostic disable
version = '0.21.5'
local xplr = xplr
---@diagnostic enable

local home = os.getenv('HOME')
package.path = home
   .. '/.local/share/xplr/plugins/?/init.lua;'
   .. home
   .. '/.local/share/xplr/plugins/?.lua;'
   .. package.path

-- dual pane layout https://github.com/sayanarijit/dual-pane.xplr
require('dual-pane').setup({
   active_pane_width = { Percentage = 60 },
   inactive_pane_width = { Percentage = 40 },
})

-- miller columns https://github.com/sayanarijit/tri-pane.xplr
require('tri-pane').setup({
   layout_key = 'T',
   as_default_layout = false,
   left_pane_width = { Percentage = 20 },
   middle_pane_width = { Percentage = 50 },
   right_pane_width = { Percentage = 30 },
})

-- show only the relative path, no metadata
xplr.config.general.table.header.cols = {
   { format = '╭─── path', style = {} },
}
xplr.config.general.table.row.cols = {
   {
      format = 'builtin.fmt_general_table_row_cols_1',
      style = {},
   },
}
xplr.config.general.table.col_widths = {
   { Percentage = 100 },
}

-- The builtin default mode.
-- Visit the [Default Key Bindings](https://xplr.dev/en/default-key-bindings)
-- to see what each mode does.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.default = {
   name = 'default',
   key_bindings = {
      on_key = {
         ['#'] = {
            messages = {
               'PrintAppStateAndQuit',
            },
         },
         ['.'] = {
            help = 'show hidden',
            messages = {
               {
                  ToggleNodeFilter = {
                     filter = 'RelativePathDoesNotStartWith',
                     input = '.',
                  },
               },
               'ExplorePwdAsync',
            },
         },
         [':'] = {
            help = 'action',
            messages = {
               'PopMode',
               { SwitchModeBuiltin = 'action' },
            },
         },
         ['G'] = {
            help = 'go to bottom',
            messages = {
               'PopMode',
               'FocusLast',
            },
         },
         ['ctrl-a'] = {
            help = 'select/unselect all',
            messages = {
               'ToggleSelectAll',
            },
         },
         ['/'] = {
            help = 'search',
            messages = {
               'PopMode',
               { SwitchModeBuiltin = 'search' },
               { SetInputBuffer = '' },
            },
         },
         ['ctrl-i'] = {
            help = 'next visited path',
            messages = {
               'NextVisitedPath',
            },
         },
         ['ctrl-o'] = {
            help = 'last visited path',
            messages = {
               'LastVisitedPath',
            },
         },
         [')'] = {
            help = 'next deep branch',
            messages = {
               'NextVisitedDeepBranch',
            },
         },
         ['('] = {
            help = 'prev deep branch',
            messages = {
               'PreviousVisitedDeepBranch',
            },
         },
         ['ctrl-r'] = {
            help = 'refresh screen',
            messages = {
               'ClearScreen',
            },
         },
         ['ctrl-u'] = {
            help = 'clear selection',
            messages = {
               'ClearSelection',
            },
         },
         ['ctrl-w'] = {
            help = 'switch layout',
            messages = {
               { SwitchModeBuiltin = 'switch_layout' },
            },
         },
         ['d'] = {
            help = 'delete',
            messages = {
               'PopMode',
               { SwitchModeBuiltin = 'delete' },
            },
         },
         ['down'] = {
            help = 'down',
            messages = {
               'FocusNext',
            },
         },
         ['Q'] = {
            help = 'quit with result',
            messages = {
               'PrintResultAndQuit',
            },
         },
         ['f'] = {
            help = 'filter',
            messages = {
               'PopMode',
               { SwitchModeBuiltin = 'filter' },
            },
         },
         ['g'] = {
            help = 'go to',
            messages = {
               'PopMode',
               { SwitchModeBuiltin = 'go_to' },
            },
         },
         ['left'] = {
            help = 'back',
            messages = {
               'Back',
            },
         },
         ['q'] = {
            help = 'quit',
            messages = {
               'Quit',
            },
         },
         ['r'] = {
            help = 'rename',
            messages = {
               'PopMode',
               { SwitchModeBuiltin = 'rename' },
               {
                  BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
               },
            },
         },
         ['ctrl-d'] = {
            help = 'duplicate as',
            messages = {
               'PopMode',
               { SwitchModeBuiltin = 'duplicate_as' },
               {
                  BashExecSilently0 = [===[
              NAME=$(basename "${XPLR_FOCUS_PATH:?}")
              "$XPLR" -m 'SetInputBuffer: %q' "${NAME:?}"
            ]===],
               },
            },
         },
         ['right'] = {
            help = 'enter',
            messages = {
               'Enter',
            },
         },
         ['s'] = {
            help = 'sort',
            messages = {
               'PopMode',
               { SwitchModeBuiltin = 'sort' },
            },
         },
         ['space'] = {
            help = 'toggle selection',
            messages = {
               'ToggleSelection',
               'FocusNext',
            },
         },
         ['up'] = {
            help = 'up',
            messages = {
               'FocusPrevious',
            },
         },
         ['~'] = {
            help = 'go home',
            messages = {
               {
                  BashExecSilently0 = [===[
              "$XPLR" -m 'ChangeDirectory: %q' "${HOME:?}"
            ]===],
               },
            },
         },
         ['page-up'] = {
            help = 'scroll up',
            messages = {
               'ScrollUp',
            },
         },
         ['page-down'] = {
            help = 'scroll down',
            messages = {
               'ScrollDown',
            },
         },
         ['{'] = {
            help = 'scroll up half',
            messages = {
               'ScrollUpHalf',
            },
         },
         ['}'] = {
            help = 'scroll down half',
            messages = {
               'ScrollDownHalf',
            },
         },
         ['ctrl-n'] = {
            help = 'next selection',
            messages = {
               'FocusNextSelection',
            },
         },
         ['ctrl-p'] = {
            help = 'prev selection',
            messages = {
               'FocusPreviousSelection',
            },
         },
      },
      on_number = {
         help = 'input',
         messages = {
            'PopMode',
            { SwitchModeBuiltin = 'number' },
            'BufferInputFromKey',
         },
      },
   },
}

xplr.config.modes.builtin.default.key_bindings.on_key['v'] =
   xplr.config.modes.builtin.default.key_bindings.on_key['space']
xplr.config.modes.builtin.default.key_bindings.on_key['V'] =
   xplr.config.modes.builtin.default.key_bindings.on_key['ctrl-a']
xplr.config.modes.builtin.default.key_bindings.on_key['h'] =
   xplr.config.modes.builtin.default.key_bindings.on_key['left']
xplr.config.modes.builtin.default.key_bindings.on_key['j'] =
   xplr.config.modes.builtin.default.key_bindings.on_key['down']
xplr.config.modes.builtin.default.key_bindings.on_key['k'] =
   xplr.config.modes.builtin.default.key_bindings.on_key['up']
xplr.config.modes.builtin.default.key_bindings.on_key['l'] =
   xplr.config.modes.builtin.default.key_bindings.on_key['right']
xplr.config.modes.builtin.default.key_bindings.on_key['enter'] =
   xplr.config.modes.builtin.default.key_bindings.on_key['right']
xplr.config.modes.builtin.default.key_bindings.on_key['ctrl-f'] =
   xplr.config.modes.builtin.default.key_bindings.on_key['page-down']
xplr.config.modes.builtin.default.key_bindings.on_key['ctrl-b'] =
   xplr.config.modes.builtin.default.key_bindings.on_key['page-up']
xplr.config.modes.builtin.default.key_bindings.on_key['tab'] =
   xplr.config.modes.builtin.default.key_bindings.on_key['ctrl-i'] -- compatibility workaround
xplr.config.modes.builtin.default.key_bindings.on_key['?'] =
   xplr.config.general.global_key_bindings.on_key['f1']

-- The builtin search mode.
--
-- Type: [Mode](https://xplr.dev/en/mode)
xplr.config.modes.builtin.search = {
   name = 'search',
   prompt = '/',
   key_bindings = {
      on_key = {
         ['up'] = {
            help = 'up',
            messages = {
               'FocusPrevious',
            },
         },
         ['down'] = {
            help = 'down',
            messages = {
               'FocusNext',
            },
         },
         ['ctrl-z'] = {
            help = 'toggle ordering',
            messages = {
               'ToggleSearchOrder',
               'ExplorePwdAsync',
            },
         },
         ['ctrl-a'] = {
            help = 'toggle search algorithm',
            messages = {
               'ToggleSearchAlgorithm',
               'ExplorePwdAsync',
            },
         },
         ['ctrl-r'] = {
            help = 'regex search',
            messages = {
               'SearchRegexFromInput',
               'ExplorePwdAsync',
            },
         },
         ['ctrl-f'] = {
            help = 'fuzzy search',
            messages = {
               'SearchFuzzyFromInput',
               'ExplorePwdAsync',
            },
         },
         ['ctrl-s'] = {
            help = 'sort (no search order)',
            messages = {
               'DisableSearchOrder',
               'ExplorePwdAsync',
               { SwitchModeBuiltinKeepingInputBuffer = 'sort' },
            },
         },
         ['right'] = {
            help = 'enter',
            messages = {
               'Enter',
               { SetInputBuffer = '' },
            },
         },
         ['left'] = {
            help = 'back',
            messages = {
               'Back',
               { SetInputBuffer = '' },
            },
         },
         ['tab'] = {
            help = 'toggle selection',
            messages = {
               'ToggleSelection',
               'FocusNext',
            },
         },
         ['ctrl-j'] = {
            help = 'submit',
            messages = {
               'AcceptSearch',
               'PopMode',
            },
         },
         ['esc'] = {
            help = 'cancel',
            messages = {
               'CancelSearch',
               'PopMode',
            },
         },
      },
      default = {
         messages = {
            'UpdateInputBufferFromKey',
            'SearchFromInput',
            'ExplorePwdAsync',
         },
      },
   },
}

xplr.config.modes.builtin.search.key_bindings.on_key['ctrl-n'] =
   xplr.config.modes.builtin.search.key_bindings.on_key['down']
xplr.config.modes.builtin.search.key_bindings.on_key['ctrl-p'] =
   xplr.config.modes.builtin.search.key_bindings.on_key['up']
xplr.config.modes.builtin.search.key_bindings.on_key['enter'] =
   xplr.config.modes.builtin.search.key_bindings.on_key['right']
