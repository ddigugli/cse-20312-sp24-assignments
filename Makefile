BRANCH?=	$(shell git rev-parse --abbrev-ref HEAD)

test:	
	@$(MAKE) -sk test-code

test-code:
	@[ "$(BRANCH)" = "master" -o -z "$(BRANCH)" ] \
	    || [ ! -f "$(BRANCH)/Makefile" ] \
	    || (cd $(BRANCH) && make -s test)
