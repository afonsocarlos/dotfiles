local ls = require "luasnip"

local c = ls.choice_node
local d = ls.dynamic_node
local f = ls.function_node
local i = ls.insert_node
local r = ls.restore_node
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt

local fill_parameters = function(args)
  if #args[1][1] == 0 then
    return ""
  end
  local arguments = vim.split(args[1][1], ",")
  for k, argument in ipairs(arguments) do
    arguments[k] = " * @param " .. argument:gsub("^%s*", ""):gsub("%s=.*$", "")
  end
  table.insert(arguments, 1, "")
  return arguments
end

local fill_attributes = function(args)
  if #args[1][1] == 0 then
    return ""
  end
  local arguments = vim.split(args[1][1], ",")
  for k, argument in ipairs(arguments) do
    local attr = argument:gsub("[%a%s]+%$", ""):gsub("%s=.*$", "")
    arguments[k] = "    $this->" .. attr .. " = $" .. attr .. ";"
  end
  table.insert(arguments, 1, "")
  return arguments
end

return {
  s({
    trig = "class",
    dscr = "Class declaration",
  }, fmt([[
      <?php

      namespace {namespace};

      /**
       * @package {package}
       */
      class {class}{extra}
      {{
          {}
      }}
    ]], {
    i(0),
    namespace = dl(1,
      l.RELATIVE_FILEPATH
      :gsub("/?%a*.php$", "")
      :gsub("/src/", "/")
      :gsub("/tests?/", "/")
      :gsub("/", "\\")
      :gsub("^%l", string.upper),
      {}
    ),
    package = f(function (args) return args[1][1] end, { 1 }),
    class = dl(2, l.TM_FILENAME_BASE, {}),
    extra = c(3, {
      sn(nil, { t " extends ", r(1, "other_class", i(3, "Base")) }),
      sn(nil, { t " implements ", r(1, "other_class") }),
      t "",
    }),
  })),
  s({
    trig = "cons?t?r?u?c?t?",
    regTrig = true,
    dscr = "Class __construct()",
  }, fmt([[
      /**{parameters}
       */
      public function __construct({arguments})
      {{{attributes}{}
      }}
    ]], {
    i(0),
    arguments = i(1),
    parameters = f(fill_parameters, { 1 }),
    attributes = f(fill_attributes, { 1 }),
  })),
  s({
    trig = "pub",
    dscr = "public {static} function method()",
  }, fmt([[
      /**{parameters}
       * @return {return_string}
       */
      public {method}({arguments}){return_type}
      {{
          {}
      }}
    ]], {
    i(0),
    method = c(1, {
      sn(nil, { t "function ", r(1, "method", i(1, "method")) }),
      sn(nil, { t "static function ", r(1, "method") }),
    }),
    return_type = c(2, {
      sn(nil, { t ": ", r(1, "return_type", i(2, "void")) }),
      t "",
    }),
    return_string = f(function(args) return args[1][1]:gsub("[:%s]*", "") end, { 2 }),
    arguments = i(3),
    parameters = f(fill_parameters, { 3 }),
  })),
  s({
    trig = "test",
    dscr = "public  function test()",
  }, fmt([[
      /**
       * @test
       */
      public function test{method}(): void
      {{
          {}
      }}
    ]], {
    i(0),
    method = i(1),
  })),
  s("if",
    fmt([[
      if ({condition}) {{
          {}
      }}
    ]], {
      i(0),
      condition = c(1, {
        sn(nil, { t "", r(1, "condition", i(1, "condition")) }),
        sn(nil, { t "!", r(1, "condition") }),
      }),
    })),
  s({
    trig = "for",
    dscr = "for loop",
  },
    fmt([[
      for (${variable} = {start}; ${variable} < {limit}; ${variable}++) {{
          {}
      }}
    ]], {
      i(0),
      variable = i(1, "i"),
      start = i(2, "0"),
      limit = i(3, "10"),
    },
    { repeat_duplicates = true })
  ),
  s({
    trig = "forea?c?h?",
    regTrig = true,
  },
    fmt([[
      foreach ({items} as {item}) {{
          {}
      }}
    ]], {
      i(0),
      items = i(1, "$items"),
      item = c(2, {
        sn(nil, { t "", r(1, "item", i(2, "$item")) }),
        sn(nil, { t "$key => ", r(1, "item") }),
      }),
    })),
  s("try",
    fmt([[
      try {{
          {}
      }} catch ({exception}) {{
          {handle}
      }}
    ]], {
      i(0),
      exception = c(1, {
        sn(nil, { t "", r(1, "exception", i(1, "Exception $e")) }),
        sn(nil, { t "!", r(1, "exception") }),
      }),
      handle = i(2, "// Handle")
    })),
}
