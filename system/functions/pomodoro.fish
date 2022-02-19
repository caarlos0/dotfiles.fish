function pomodoro -d "a cli pomodoro"
	while true
		say "Let's go!"
		timer --for 50m --name Working
		say "Break!"
		terminal-notifier -message "Time to rest..." -title Pomodoro -subtitle "Done!" -ignoreDnd -sound default
		timer --for 10m --name Break
		terminal-notifier -message "Let's get back to it" -title Pomodoro -subtitle "Let's go!" -ignoreDnd -sound default
	end
end
