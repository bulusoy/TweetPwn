FILE=TweetPwn.xm
NAME=TweetPwn.dylib
ADDONS=TweetPwn.plist
CC=g++
FLAGS=-arch x86_64 -arch i386 -lobjc -dynamiclib -framework Foundation -framework ScriptingBridge -framework AppKit -o $(NAME)
all:
	@echo "Parsing code..."
	@./LogosToStar.sh $(FILE) >fix.m
	@echo "Compiling and linking..."
	@$(CC) $(FLAGS) fix.m
	@echo "Cleaning up..."
	@rm -rf fix.m star.h
	@mkdir Result &>/dev/null || :
	@cp $(NAME) Result
	@cp $(ADDONS) Result
