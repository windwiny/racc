#
# DO NOT MODIFY!!!!
# This file was automatically generated by Racc 2.0.0-dev
# (codename: Mecha Oishii) from Racc grammar file "liquor.y".
#

require 'racc/parser.rb'
module Liquor
  class Parser < Racc::Parser

module_eval(<<'...end liquor.y/module_eval...', 'liquor.y', 216)
  attr_reader :errors, :ast

  def initialize(tags={})
    super()

    @errors = []
    @ast    = nil
    @tags   = tags
  end

  def success?
    @errors.empty?
  end

  def parse(string, name='(code)')
    @errors.clear
    @name = name
    @ast  = nil

    begin
      @stream = Lexer.lex(string, @name, @tags)
      @ast = do_parse
    rescue Liquor::SyntaxError => e
      @errors << e
    end

    success?
  end

  def next_token
    tok = @stream.shift
    [ tok[0], tok ] if tok
  end

  TOKEN_NAME_MAP = {
    :comma    => ',',
    :dot      => '.',
    :lblock   => '{%',
    :rblock   => '%}',
    :linterp  => '{{',
    :rinterp  => '}}',
    :lbracket => '[',
    :rbracket => ']',
    :lparen   => '(',
    :rparen   => ')',
    :pipe     => '|',
    :op_not   => '!',
    :op_mul   => '*',
    :op_div   => '/',
    :op_mod   => '%',
    :op_plus  => '+',
    :op_minus => '-',
    :op_eq    => '==',
    :op_neq   => '!=',
    :op_lt    => '<',
    :op_leq   => '<=',
    :op_gt    => '>',
    :op_geq   => '>=',
    :keyword  => 'keyword argument name',
    :kwarg    => 'keyword argument',
    :ident    => 'identifier',
  }

  def on_error(error_token_id, error_token, value_stack)
    if token_to_str(error_token_id) == "$end"
      raise Liquor::SyntaxError.new("unexpected end of program", {
        file: @name
      })
    else
      type, (loc, value) = error_token
      type = TOKEN_NAME_MAP[type] || type

      raise Liquor::SyntaxError.new("unexpected token `#{type}'", loc)
    end
  end

  def retag(nodes)
    loc = nodes.map { |node| node[1] }.compact
    first, *, last = loc
    return first if last.nil?

    {
      file:  first[:file],
      line:  first[:line],
      start: first[:start],
      end:    last[:end],
    }
  end

  def reduce_tag_args(list)
    list.each_slice(2).reduce([]) { |args, (k, v)|
      if v[0] == :block
        args << [ :blockarg, retag([ k, v ]), k, v[2] || [] ]
      else
        args << [ :kwarg,    retag([ k, v ]), k, v          ]
      end
    }
  end
...end liquor.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
26, 26, 26, 96, 7, 22, 97, 25, 25, 25, 28, 32, 36, 37, 34, 
35, 31, 29, 27, 33, 26, 30, 38, 39, 26, 13, 15, 25, 26, 75, 
21, 25, 14, 96, 28, 25, 97, 23, 41, 18, 31, 29, 27, 19, 26, 
30, 96, 43, 54, 97, 70, 25, 77, 16, 28, 32, 36, 37, 34, 35, 
31, 29, 27, 33, 26, 30, 38, 39, 40, 13, 15, 25, 24, 43, 21, 
84, 14, 13, 15, 74, 87, 70, 21, 18, 14, 13, 15, 19, 94, 98, 
21, 18, 14, 13, 15, 19, 107, 16, 21, 18, 14, 111, nil, 19, nil, 
16, 6, 18, nil, 5, nil, 19, nil, 16, nil, 13, 15, 52, 13, 15, 
21, 16, 14, 21, nil, 14, 2, nil, nil, 18, 13, 15, 18, 19, nil, 
21, 19, 14, nil, 51, nil, nil, 6, 16, 18, 5, 16, nil, 19, 13, 
15, nil, 13, 15, 21, nil, 14, 21, 16, 14, nil, nil, 2, 18, 13, 
15, 18, 19, nil, 21, 19, 14, nil, nil, nil, nil, 6, 16, 18, 5, 
16, nil, 19, 13, 15, nil, 13, 15, 21, nil, 14, 21, 16, 14, nil, 
nil, 2, 18, 13, 15, 18, 19, nil, 21, 19, 14, nil, nil, nil, nil, 
6, 16, 18, 5, 16, nil, 19, 13, 15, nil, 13, 15, 21, nil, 14, 
21, 16, 14, nil, nil, 2, 18, 13, 15, 18, 19, nil, 21, 19, 14, 
nil, nil, nil, nil, 6, 16, 18, 5, 16, nil, 19, 13, 15, nil, 13, 
15, 21, nil, 14, 21, 16, 14, nil, nil, 2, 18, 13, 15, 18, 19, 
nil, 21, 19, 14, nil, nil, nil, nil, 6, 16, 18, 5, 16, nil, 19, 
13, 15, 74, 13, 15, 21, nil, 14, 21, 16, 14, nil, nil, 2, 18, 
13, 15, 18, 19, nil, 21, 19, 14, nil, nil, nil, nil, 81, 16, 18, 
nil, 16, nil, 19, 13, 15, nil, 13, 15, 21, nil, 14, 21, 16, 14, 
nil, nil, nil, 18, 13, 15, 18, 19, nil, 21, 19, 14, nil, nil, nil, 
nil, 101, 16, 18, nil, 16, nil, 19, 26, nil, nil, nil, nil, 106, nil, 
25, nil, 16, 28, 32, 36, 37, 34, 35, 31, 29, 27, 33, nil, 30, 
38, 39, 26, nil, nil, 82, 52, 6, nil, 25, 5, nil, 28, 32, 36, 
37, 34, 35, 31, 29, 27, 33, 26, 30, 38, 39, 52, 2, 51, 25, 
nil, nil, 28, 32, 36, 37, 34, 35, 31, 29, 27, 33, nil, 30, 38, 
39, 76, 26, 51, nil, nil, nil, nil, nil, 25, nil, nil, 28, 32, 36, 
37, 34, 35, 31, 29, 27, 33, 26, 30, 38, 39, 74, nil, nil, 25, 
nil, nil, 28, 32, 36, 37, 34, 35, 31, 29, 27, 33, 26, 30, 38, 
39, 74, nil, nil, 25, nil, nil, 28, 32, 36, 37, 34, 35, 31, 29, 
27, 33, 26, 30, 38, 39, 102, nil, nil, 25, nil, nil, 28, 32, 36, 
37, 34, 35, 31, 29, 27, 33, nil, 30, 38, 39, 26, 96, nil, nil, 
97, nil, nil, 25, nil, nil, 28, 32, 36, 37, 34, 35, 31, 29, 27, 
33, 26, 30, 38, 39, nil, nil, nil, 25, nil, nil, 28, 32, 36, 37, 
34, 35, 31, 29, 27, 33, 26, 30, 38, nil, nil, nil, nil, 25, nil, 
nil, 28, nil, 26, nil, nil, nil, 31, 29, 27, 25, nil, 30, 28, nil, 
26, nil, nil, nil, 31, 29, 27, 25, nil, 30, 28, nil, 26, nil, nil, 
nil, 31, 29, 27, 25, nil, 30, 28, nil, 26, nil, nil, nil, 31, 29, 
27, 25, nil, 30, 28, nil, 26, nil, nil, nil, 31, 29, 27, 25, nil, 
30, 28, 32, 36, 37, 34, 35, 31, 29, 27, 33, 26, 30, 26, nil, 
nil, nil, nil, 25, nil, 25, 28, nil, 28, nil, nil, nil, nil, 29, 27, 
29, 27]

racc_action_check = [
44, 45, 46, 94, 1, 6, 94, 44, 45, 46, 44, 44, 44, 44, 44, 
44, 44, 44, 44, 44, 55, 44, 44, 44, 60, 5, 5, 55, 56, 44, 
5, 60, 5, 107, 60, 56, 107, 7, 12, 5, 60, 60, 60, 5, 11, 
60, 111, 13, 26, 111, 40, 11, 48, 5, 11, 11, 11, 11, 11, 11, 
11, 11, 11, 11, 57, 11, 11, 11, 11, 14, 14, 57, 11, 54, 14, 
69, 14, 18, 18, 70, 72, 84, 18, 14, 18, 19, 19, 14, 91, 96, 
19, 18, 19, 21, 21, 18, 103, 14, 21, 19, 21, 109, nil, 19, nil, 
18, 0, 21, nil, 0, nil, 21, nil, 19, nil, 22, 22, 22, 25, 25, 
22, 21, 22, 25, nil, 25, 0, nil, nil, 22, 27, 27, 25, 22, nil, 
27, 25, 27, nil, 22, nil, nil, 2, 22, 27, 2, 25, nil, 27, 28, 
28, nil, 29, 29, 28, nil, 28, 29, 27, 29, nil, nil, 2, 28, 30, 
30, 29, 28, nil, 30, 29, 30, nil, nil, nil, nil, 3, 28, 30, 3, 
29, nil, 30, 31, 31, nil, 32, 32, 31, nil, 31, 32, 30, 32, nil, 
nil, 3, 31, 33, 33, 32, 31, nil, 33, 32, 33, nil, nil, nil, nil, 
4, 31, 33, 4, 32, nil, 33, 34, 34, nil, 35, 35, 34, nil, 34, 
35, 33, 35, nil, nil, 4, 34, 36, 36, 35, 34, nil, 36, 35, 36, 
nil, nil, nil, nil, 81, 34, 36, 81, 35, nil, 36, 37, 37, nil, 38, 
38, 37, nil, 37, 38, 36, 38, nil, nil, 81, 37, 39, 39, 38, 37, 
nil, 39, 38, 39, nil, nil, nil, nil, 101, 37, 39, 101, 38, nil, 39, 
43, 43, 43, 52, 52, 43, nil, 43, 52, 39, 52, nil, nil, 101, 43, 
74, 74, 52, 43, nil, 74, 52, 74, nil, nil, nil, nil, 52, 43, 74, 
nil, 52, nil, 74, 76, 76, nil, 97, 97, 76, nil, 76, 97, 74, 97, 
nil, nil, nil, 76, 102, 102, 97, 76, nil, 102, 97, 102, nil, nil, nil, 
nil, 97, 76, 102, nil, 97, nil, 102, 53, nil, nil, nil, nil, 102, nil, 
53, nil, 102, 53, 53, 53, 53, 53, 53, 53, 53, 53, 53, nil, 53, 
53, 53, 49, nil, nil, 53, 49, 106, nil, 49, 106, nil, 49, 49, 49, 
49, 49, 49, 49, 49, 49, 49, 79, 49, 49, 49, 79, 106, 49, 79, 
nil, nil, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, nil, 79, 79, 
79, 47, 47, 79, nil, nil, nil, nil, nil, 47, nil, nil, 47, 47, 47, 
47, 47, 47, 47, 47, 47, 47, 71, 47, 47, 47, 71, nil, nil, 71, 
nil, nil, 71, 71, 71, 71, 71, 71, 71, 71, 71, 71, 88, 71, 71, 
71, 88, nil, nil, 88, nil, nil, 88, 88, 88, 88, 88, 88, 88, 88, 
88, 88, 99, 88, 88, 88, 99, nil, nil, 99, nil, nil, 99, 99, 99, 
99, 99, 99, 99, 99, 99, 99, nil, 99, 99, 99, 104, 104, nil, nil, 
104, nil, nil, 104, nil, nil, 104, 104, 104, 104, 104, 104, 104, 104, 104, 
104, 67, 104, 104, 104, nil, nil, nil, 67, nil, nil, 67, 67, 67, 67, 
67, 67, 67, 67, 67, 67, 61, 67, 67, nil, nil, nil, nil, 61, nil, 
nil, 61, nil, 62, nil, nil, nil, 61, 61, 61, 62, nil, 61, 62, nil, 
63, nil, nil, nil, 62, 62, 62, 63, nil, 62, 63, nil, 64, nil, nil, 
nil, 63, 63, 63, 64, nil, 63, 64, nil, 65, nil, nil, nil, 64, 64, 
64, 65, nil, 64, 65, nil, 66, nil, nil, nil, 65, 65, 65, 66, nil, 
65, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 58, 66, 59, nil, 
nil, nil, nil, 58, nil, 59, 58, nil, 59, nil, nil, nil, nil, 58, 58, 
59, 59]

racc_action_pointer = [
98, 4, 134, 168, 202, 20, 0, 37, nil, nil, nil, 41, 7, 35, 64, 
nil, nil, nil, 72, 80, nil, 88, 110, nil, nil, 113, 43, 125, 144, 147, 
159, 178, 181, 193, 212, 215, 227, 246, 249, 261, 45, nil, nil, 280, -3, -2, -
1, 419, 22, 374, nil, nil, 283, 350, 61, 17, 25, 61, 623, 625, 21, 
543, 555, 567, 579, 591, 603, 523, nil, 48, 72, 439, 48, nil, 295, nil, 
314, nil, nil, 394, nil, 236, nil, nil, 76, nil, nil, nil, 459, nil, nil, 
79, nil, nil, -
1, nil, 60, 317, nil, 479, nil, 270, 329, 87, 503, nil, 374, 29, nil, 
92, nil, 42, nil]

racc_action_default = [-1, -57, -1, -1, -1, -57, -57, -57, -2, -3, -4, -57, -57, -7, -57, -9, -10, -11, -57, -57, -31, -35, -57, 113, -5, -57, -57, -57, -57, -57, -57, -57, -57, -57, -57, -57, -57, -57, -57, -57, -57, -6, -12, -40, -57, -16, -17, -34, -57, -57, -46, -47, -57, -57, -15, -18, -19, -20, -21, -22, -23, -24, -25, -26, -27, -28, -29, -30, -41, -43, -40, -40, -57, -38, -57, -8, -35, -32, -45, -57, -48, -1, -13, -14, -57, -44, -37, -36, -40, -33, -50, -57, -42, -39, -57, -49, -57, -57, -51, -57, -52, -1, -57, -57, -57, -54, -1, -57, -56, -57, -53, -57, -55]

racc_goto_table = [
1, 11, 8, 9, 10, 48, 68, 12, 42, 50, 44, 72, 80, 73, 45, 
46, 100, 105, 49, nil, nil, 53, nil, 55, 56, 57, 58, 59, 60, 61, 
62, 63, 64, 65, 66, 67, 78, nil, nil, 71, 85, 86, 95, nil, nil, 
nil, nil, nil, 79, 83, 92, nil, 108, nil, nil, 110, nil, nil, 93, 112, 
89, nil, nil, nil, nil, nil, 90, nil, nil, nil, 88, nil, nil, nil, nil, 
nil, nil, nil, nil, nil, nil, 91, nil, nil, nil, nil, nil, nil, nil, nil, 
nil, nil, nil, 99, nil, nil, nil, nil, 104, nil, nil, 103, nil, nil, nil, 
nil, 109]

racc_goto_check = [
1, 4, 1, 1, 1, 9, 12, 5, 8, 14, 4, 10, 15, 11, 4, 
4, 17, 18, 4, nil, nil, 4, nil, 4, 4, 4, 4, 4, 4, 4, 
4, 4, 4, 4, 4, 4, 14, nil, nil, 4, 11, 11, 16, nil, nil, 
nil, nil, nil, 4, 8, 12, nil, 16, nil, nil, 16, nil, nil, 11, 16, 
9, nil, nil, nil, nil, nil, 14, nil, nil, nil, 4, nil, nil, nil, nil, 
nil, nil, nil, nil, nil, nil, 1, nil, nil, nil, nil, nil, nil, nil, nil, 
nil, nil, nil, 4, nil, nil, nil, nil, 4, nil, nil, 1, nil, nil, nil, 
nil, 1]

racc_goto_pointer = [nil, 0, nil, nil, -4, 2, nil, nil, -5, -16, -32, -30, -34, nil, -13, -40, -52, -81, -85]

racc_goto_default = [
nil, nil, 3, 4, 47, nil, 20, 17, nil, nil, nil, nil, nil, 69, nil, 
nil, nil, nil, nil]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 37, :_reduce_1,
  2, 37, :_reduce_2,
  2, 37, :_reduce_3,
  2, 37, :_reduce_4,
  3, 38, :_reduce_5,
  3, 38, :_reduce_6,
  1, 42, :_reduce_none,
  3, 42, :_reduce_8,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  1, 40, :_reduce_none,
  2, 40, :_reduce_12,
  4, 40, :_reduce_13,
  4, 40, :_reduce_14,
  3, 40, :_reduce_15,
  2, 40, :_reduce_16,
  2, 40, :_reduce_17,
  3, 40, :_reduce_18,
  3, 40, :_reduce_19,
  3, 40, :_reduce_20,
  3, 40, :_reduce_21,
  3, 40, :_reduce_22,
  3, 40, :_reduce_23,
  3, 40, :_reduce_24,
  3, 40, :_reduce_25,
  3, 40, :_reduce_26,
  3, 40, :_reduce_27,
  3, 40, :_reduce_28,
  3, 40, :_reduce_29,
  3, 40, :_reduce_30,
  1, 40, :_reduce_none,
  3, 43, :_reduce_32,
  3, 45, :_reduce_33,
  1, 45, :_reduce_34,
  0, 45, :_reduce_35,
  3, 44, :_reduce_36,
  2, 46, :_reduce_37,
  1, 46, :_reduce_38,
  3, 47, :_reduce_39,
  0, 47, :_reduce_40,
  3, 41, :_reduce_41,
  3, 48, :_reduce_42,
  1, 48, :_reduce_43,
  2, 49, :_reduce_44,
  4, 39, :_reduce_45,
  3, 39, :_reduce_46,
  1, 50, :_reduce_47,
  2, 50, :_reduce_48,
  4, 51, :_reduce_49,
  2, 51, :_reduce_50,
  2, 52, :_reduce_51,
  2, 52, :_reduce_52,
  4, 53, :_reduce_53,
  3, 53, :_reduce_54,
  4, 54, :_reduce_55,
  2, 54, :_reduce_56 ]

racc_reduce_n = 57

racc_shift_n = 113

racc_token_table = {
  false => 0,
  :error => 1,
  :comma => 2,
  :dot => 3,
  :endtag => 4,
  :ident => 5,
  :integer => 6,
  :keyword => 7,
  :lblock => 8,
  :lblock2 => 9,
  :lbracket => 10,
  :linterp => 11,
  :lparen => 12,
  :op_div => 13,
  :op_eq => 14,
  :op_gt => 15,
  :op_geq => 16,
  :op_lt => 17,
  :op_leq => 18,
  :op_minus => 19,
  :op_mod => 20,
  :op_mul => 21,
  :op_neq => 22,
  :op_not => 23,
  :op_plus => 24,
  :op_and => 25,
  :op_or => 26,
  :pipe => 27,
  :plaintext => 28,
  :rblock => 29,
  :rbracket => 30,
  :rinterp => 31,
  :rparen => 32,
  :string => 33,
  :tag_ident => 34,
  :op_uminus => 35 }

racc_nt_base = 36

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "comma",
  "dot",
  "endtag",
  "ident",
  "integer",
  "keyword",
  "lblock",
  "lblock2",
  "lbracket",
  "linterp",
  "lparen",
  "op_div",
  "op_eq",
  "op_gt",
  "op_geq",
  "op_lt",
  "op_leq",
  "op_minus",
  "op_mod",
  "op_mul",
  "op_neq",
  "op_not",
  "op_plus",
  "op_and",
  "op_or",
  "pipe",
  "plaintext",
  "rblock",
  "rbracket",
  "rinterp",
  "rparen",
  "string",
  "tag_ident",
  "op_uminus",
  "$start",
  "block",
  "interp",
  "tag",
  "expr",
  "filter_chain",
  "primary_expr",
  "tuple",
  "function_args",
  "tuple_content",
  "function_args_inside",
  "function_keywords",
  "filter_chain_cont",
  "filter_call",
  "tag_first_cont",
  "tag_first_cont2",
  "tag_next_cont",
  "tag_next_cont2",
  "tag_next_cont3" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'liquor.y', 47)
  def _reduce_1(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 49)
  def _reduce_2(val, _values, result)
     result = [ val[0], *val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 51)
  def _reduce_3(val, _values, result)
     result = [ val[0], *val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 53)
  def _reduce_4(val, _values, result)
     result = [ val[0], *val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 57)
  def _reduce_5(val, _values, result)
     result = [ :interp, retag(val), val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 59)
  def _reduce_6(val, _values, result)
     result = [ :interp, retag(val), val[1] ] 
    result
  end
.,.,

# reduce 7 omitted

module_eval(<<'.,.,', 'liquor.y', 64)
  def _reduce_8(val, _values, result)
     result = [ val[1][0], retag(val), *val[1][2..-1] ] 
    result
  end
.,.,

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

module_eval(<<'.,.,', 'liquor.y', 71)
  def _reduce_12(val, _values, result)
     result = [ :call,   retag(val), val[0], val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 73)
  def _reduce_13(val, _values, result)
     result = [ :index,  retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 75)
  def _reduce_14(val, _values, result)
     result = [ :external, retag(val), val[0], val[2], val[3] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 77)
  def _reduce_15(val, _values, result)
     result = [ :external, retag(val), val[0], val[2], nil ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 79)
  def _reduce_16(val, _values, result)
     result = [ :uminus, retag(val), val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 81)
  def _reduce_17(val, _values, result)
     result = [ :not, retag(val), val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 83)
  def _reduce_18(val, _values, result)
     result = [ :mul, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 85)
  def _reduce_19(val, _values, result)
     result = [ :div, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 87)
  def _reduce_20(val, _values, result)
     result = [ :mod, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 89)
  def _reduce_21(val, _values, result)
     result = [ :plus, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 91)
  def _reduce_22(val, _values, result)
     result = [ :minus, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 93)
  def _reduce_23(val, _values, result)
     result = [ :eq, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 95)
  def _reduce_24(val, _values, result)
     result = [ :neq, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 97)
  def _reduce_25(val, _values, result)
     result = [ :lt, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 99)
  def _reduce_26(val, _values, result)
     result = [ :leq, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 101)
  def _reduce_27(val, _values, result)
     result = [ :gt, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 103)
  def _reduce_28(val, _values, result)
     result = [ :geq, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 105)
  def _reduce_29(val, _values, result)
     result = [ :and, retag(val), val[0], val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 107)
  def _reduce_30(val, _values, result)
     result = [ :or, retag(val), val[0], val[2] ] 
    result
  end
.,.,

# reduce 31 omitted

module_eval(<<'.,.,', 'liquor.y', 112)
  def _reduce_32(val, _values, result)
     result = [ :tuple, retag(val), val[1].compact ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 116)
  def _reduce_33(val, _values, result)
     result = [ val[0], *val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 118)
  def _reduce_34(val, _values, result)
     result = [ val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 120)
  def _reduce_35(val, _values, result)
     result = [ ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 124)
  def _reduce_36(val, _values, result)
     result = [ :args, retag(val), *val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 128)
  def _reduce_37(val, _values, result)
     result = [ val[0], val[1][2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 130)
  def _reduce_38(val, _values, result)
     result = [ nil,    val[0][2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 134)
  def _reduce_39(val, _values, result)
     name = val[0][2].to_sym
        tail = val[2][2]
        loc  = retag([ val[0], val[1] ])

        if tail.include? name
          @errors << SyntaxError.new("duplicate keyword argument `#{val[0][2]}'",
              tail[name][1])
        end

        hash = {
          name => [ val[1][0], loc, *val[1][2..-1] ]
        }.merge(tail)

        result = [ :keywords, retag([ loc, val[2] ]), hash ]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 150)
  def _reduce_40(val, _values, result)
     result = [ :keywords, nil, {} ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 154)
  def _reduce_41(val, _values, result)
     result = [ val[0], *val[2] ].
            reduce { |tree, node| node[3][2] = tree; node }
      
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 160)
  def _reduce_42(val, _values, result)
     result = [ val[0], *val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 162)
  def _reduce_43(val, _values, result)
     result = [ val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 166)
  def _reduce_44(val, _values, result)
     ident_loc = val[0][1]
        empty_args_loc = { line:  ident_loc[:line],
                           start: ident_loc[:end] + 1,
                           end:   ident_loc[:end] + 1, }
        result = [ :call, val[0][1], val[0],
                   [ :args, val[1][1] || empty_args_loc, nil, val[1][2] ] ]
      
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 176)
  def _reduce_45(val, _values, result)
     result = [ :tag, retag(val), val[1], val[2], *reduce_tag_args(val[3][2]) ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 178)
  def _reduce_46(val, _values, result)
     result = [ :tag, retag(val), val[1], nil,    *reduce_tag_args(val[2][2]) ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 186)
  def _reduce_47(val, _values, result)
     result = [ :cont,  retag(val), [] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 188)
  def _reduce_48(val, _values, result)
     result = [ :cont,  retag(val), [ val[0], *val[1][2] ] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 192)
  def _reduce_49(val, _values, result)
     result = [ :cont2, val[0][1],  [ [:block, val[0][1], val[1] ], *val[3] ] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 194)
  def _reduce_50(val, _values, result)
     result = [ :cont2, retag(val), [ val[0], *val[1][2] ] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 198)
  def _reduce_51(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 200)
  def _reduce_52(val, _values, result)
     result = [ val[0], *val[1] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 204)
  def _reduce_53(val, _values, result)
     result = [ [:block, val[0][1], val[1] ], *val[3] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 206)
  def _reduce_54(val, _values, result)
     result = [ val[0], val[1], *val[2] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 210)
  def _reduce_55(val, _values, result)
     result = [ [:block, val[0][1], val[1] ], *val[3] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'liquor.y', 212)
  def _reduce_56(val, _values, result)
     result = [ val[0], *val[1] ] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Liquor
