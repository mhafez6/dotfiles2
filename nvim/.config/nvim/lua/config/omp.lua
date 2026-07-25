local M = {}

local function notify(message, level)
  vim.notify(message, level or vim.log.levels.INFO, { title = "OMP" })
end

local function ensure_runtime()
  if not vim.env.ZELLIJ or vim.env.ZELLIJ == "" then
    notify("Start Neovim inside Zellij to open an OMP pane", vim.log.levels.ERROR)
    return false
  end

  for _, executable in ipairs({ "zellij", "omp" }) do
    if vim.fn.executable(executable) ~= 1 then
      notify(executable .. " is not available on $PATH", vim.log.levels.ERROR)
      return false
    end
  end

  return true
end

local function cwd()
  local path = vim.api.nvim_buf_get_name(0)
  return path == "" and vim.fn.getcwd() or vim.fs.dirname(path)
end

local function start(command, context_path)
  local job_id = vim.fn.jobstart(command, {
    on_exit = function(_, code)
      if code ~= 0 then
        if context_path then
          vim.fn.delete(context_path)
        end
        vim.schedule(function()
          notify("Zellij could not open the OMP pane", vim.log.levels.ERROR)
        end)
      end
    end,
  })

  if job_id <= 0 then
    if context_path then
      vim.fn.delete(context_path)
    end
    notify("Could not start Zellij", vim.log.levels.ERROR)
  end
end

local function selected_context()
  local mode = vim.api.nvim_get_mode().mode
  local first, last
  if mode == "v" or mode == "V" or mode == "\22" then
    first = vim.fn.getpos("v")
    last = vim.fn.getpos(".")
  else
    first = vim.fn.getpos("'<")
    last = vim.fn.getpos("'>")
  end

  if first[2] > last[2] then
    first, last = last, first
  end

  if first[2] == 0 or last[2] == 0 then
    notify("Select lines first", vim.log.levels.ERROR)
    return
  end

  local path = vim.api.nvim_buf_get_name(0)
  local lines = vim.api.nvim_buf_get_lines(0, first[2] - 1, last[2], false)
  local context_path = vim.fn.tempname() .. ".md"
  local source = path == "" and "[unnamed buffer]" or path
  local language = vim.bo.filetype ~= "" and vim.bo.filetype or "text"

  vim.fn.writefile(vim.list_extend({
    "# Selected context",
    "",
    string.format("Source: %s (lines %d-%d)", source, first[2], last[2]),
    "",
    "```" .. language,
  }, vim.list_extend(lines, { "```" })), context_path)

  return context_path
end

function M.ask_selection()
  if not ensure_runtime() then
    return
  end

  local context_path = selected_context()
  if not context_path then
    return
  end

  local working_directory = cwd()
  start({
    "zellij",
    "run",
    "--direction",
    "right",
    "--name",
    "OMP context",
    "--cwd",
    working_directory,
    "--",
    "sh",
    "-lc",
    'omp --cwd "$1" "@$2" "$3"; status=$?; rm -f -- "$2"; exit "$status"',
    "sh",
    working_directory,
    context_path,
    "Treat the selected text as context. I will ask a follow-up question about it. Reply briefly that the context is loaded, then wait.",
  }, context_path)
end

function M.ask_floating()
  if not ensure_runtime() then
    return
  end

  local working_directory = cwd()
  start({
    "zellij",
    "run",
    "--floating",
    "--x",
    "58%",
    "--y",
    "2%",
    "--width",
    "40%",
    "--height",
    "45%",
    "--name",
    "OMP question",
    "--close-on-exit",
    "--cwd",
    working_directory,
    "--",
    "omp",
    "--no-session",
    "--cwd",
    working_directory,
  })
end

return M
