# line 1 "lib/keyword_search.rl"
require File.dirname(__FILE__) << '/keyword_search/definition.rb'

module KeywordSearch

  class ParseError < ::SyntaxError; end  
      
  class << self
  
    # line 54 "lib/keyword_search.rl"

    
    def search(input_string, definition=nil, &block)
      definition ||= Definition.new(&block)
      results = parse(input_string)
      results.each do |key, terms|
        definition.handle(key, terms)
      end
      results
    end
    
    #######
    private
    #######
    
    def parse(input) #:nodoc:
      data = input + ' '
      
# line 30 "lib/keyword_search.rb"
class << self
	attr_accessor :_parser_actions
	private :_parser_actions, :_parser_actions=
end
self._parser_actions = [
	0, 1, 3, 1, 5, 1, 6, 2, 
	0, 2, 2, 1, 0, 3, 0, 2, 
	4, 3, 1, 0, 4
]

class << self
	attr_accessor :_parser_key_offsets
	private :_parser_key_offsets, :_parser_key_offsets=
end
self._parser_key_offsets = [
	0, 0, 6, 10, 15, 19, 20, 21, 
	22, 23
]

class << self
	attr_accessor :_parser_trans_keys
	private :_parser_trans_keys, :_parser_trans_keys=
end
self._parser_trans_keys = [
	0, 32, 34, 39, 40, 58, 32, 34, 
	41, 58, 32, 34, 39, 40, 58, 32, 
	34, 41, 58, 34, 32, 39, 41, 32, 
	34, 41, 58, 0
]

class << self
	attr_accessor :_parser_single_lengths
	private :_parser_single_lengths, :_parser_single_lengths=
end
self._parser_single_lengths = [
	0, 6, 4, 5, 4, 1, 1, 1, 
	1, 4
]

class << self
	attr_accessor :_parser_range_lengths
	private :_parser_range_lengths, :_parser_range_lengths=
end
self._parser_range_lengths = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0
]

class << self
	attr_accessor :_parser_index_offsets
	private :_parser_index_offsets, :_parser_index_offsets=
end
self._parser_index_offsets = [
	0, 0, 7, 12, 18, 23, 25, 27, 
	29, 31
]

class << self
	attr_accessor :_parser_trans_targs
	private :_parser_trans_targs, :_parser_trans_targs=
end
self._parser_trans_targs = [
	9, 0, 5, 7, 8, 0, 2, 1, 
	0, 0, 3, 2, 0, 5, 7, 8, 
	0, 4, 1, 0, 0, 0, 4, 6, 
	5, 1, 0, 6, 7, 6, 8, 1, 
	0, 0, 3, 2, 0
]

class << self
	attr_accessor :_parser_trans_actions
	private :_parser_trans_actions, :_parser_trans_actions=
end
self._parser_trans_actions = [
	7, 5, 13, 13, 13, 5, 7, 1, 
	0, 0, 0, 0, 0, 17, 17, 17, 
	0, 10, 1, 0, 0, 0, 0, 3, 
	0, 1, 0, 3, 0, 3, 0, 1, 
	0, 0, 0, 0, 0
]

class << self
	attr_accessor :_parser_eof_actions
	private :_parser_eof_actions, :_parser_eof_actions=
end
self._parser_eof_actions = [
	0, 5, 0, 0, 0, 0, 0, 0, 
	0, 0
]

class << self
	attr_accessor :parser_start
end
self.parser_start = 1;
class << self
	attr_accessor :parser_first_final
end
self.parser_first_final = 9;
class << self
	attr_accessor :parser_error
end
self.parser_error = 0;

class << self
	attr_accessor :parser_en_main
end
self.parser_en_main = 1;

# line 72 "lib/keyword_search.rl"
    	p = 0
    	eof = nil
    	pe = data.length
    	key = nil
    	tokstart = nil
    	results = {}
    	quotes = 0
      
# line 148 "lib/keyword_search.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = parser_start
end
# line 80 "lib/keyword_search.rl"
      
# line 156 "lib/keyword_search.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = _parser_key_offsets[cs]
	_trans = _parser_index_offsets[cs]
	_klen = _parser_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p] < _parser_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p] > _parser_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _parser_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p] < _parser_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p] > _parser_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	cs = _parser_trans_targs[_trans]
	if _parser_trans_actions[_trans] != 0
		_acts = _parser_trans_actions[_trans]
		_nacts = _parser_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _parser_actions[_acts - 1]
when 0 then
# line 13 "lib/keyword_search.rl"
		begin

        tokstart = p;
      		end
# line 13 "lib/keyword_search.rl"
when 1 then
# line 17 "lib/keyword_search.rl"
		begin

        key = data[tokstart...p-1]
        results[key] ||= []
      		end
# line 17 "lib/keyword_search.rl"
when 2 then
# line 22 "lib/keyword_search.rl"
		begin

        key = nil
      		end
# line 22 "lib/keyword_search.rl"
when 3 then
# line 26 "lib/keyword_search.rl"
		begin

        value = data[tokstart..p-1]
        if ["("].include?(value[0,1])
          value = parse(value[1..-2])[:default]
        elsif ["'", '"'].include?(value[0,1])
          value = value[1..-2]
        end
        (results[key || :default] ||= []) << value
      		end
# line 26 "lib/keyword_search.rl"
when 4 then
# line 36 "lib/keyword_search.rl"
		begin
 quotes += 1 		end
# line 36 "lib/keyword_search.rl"
when 5 then
# line 38 "lib/keyword_search.rl"
		begin
 quotes -= 1 		end
# line 38 "lib/keyword_search.rl"
when 6 then
# line 52 "lib/keyword_search.rl"
		begin
 raise ParseError, "At offset #{p}, near: '#{data[p,10]}'" 		end
# line 52 "lib/keyword_search.rl"
# line 286 "lib/keyword_search.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	__acts = _parser_eof_actions[cs]
	__nacts =  _parser_actions[__acts]
	__acts += 1
	while __nacts > 0
		__nacts -= 1
		__acts += 1
		case _parser_actions[__acts - 1]
when 6 then
# line 52 "lib/keyword_search.rl"
		begin
 raise ParseError, "At offset #{p}, near: '#{data[p,10]}'" 		end
# line 52 "lib/keyword_search.rl"
# line 319 "lib/keyword_search.rb"
		end # eof action switch
	end
	if _trigger_goto
		next
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end
# line 81 "lib/keyword_search.rl"
    	unless quotes.zero?
    	  raise ParseError, "Unclosed quotes"
    	end
    	results
    end
    
  end
  
end


