TEST_OPTS = --color --rerun --rerun-all-on-success

love: .cabal-sandbox
	@echo "Feel like makin' love."

.cabal-sandbox:
	cabal sandbox init
	cabal configure --disable-optimization --enable-executable-dynamic  --enable-tests
	cabal install --only-dependencies

test:
	@cabal test --test-options="$(TEST_OPTS)"

autotest:
	ghcid -c "cabal exec ghci" --warnings --test ":main" test/LangAgnosticTests.hs

clean:
	cabal clean

.PHONY: love
.PHONY: test spec autotest autospec
.PHONY: clean