if command -q brew
	function brew -w brew
		switch $argv[1]
		case cleanup
			brew-cleanup
		case bump
			brew-bump
		case '*'
			command brew $argv
		end
	end
end

abbr --add airport /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
abbr --add afk 'open -a /System/Library/CoreServices/ScreenSaverEngine.app'
