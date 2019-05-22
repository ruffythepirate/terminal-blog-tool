test:
	ruby tc_all_tests.rb

test-watch:
	while inotifywait -e close_write -r .; do ruby tc_all_tests.rb; done
