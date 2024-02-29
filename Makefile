SHELL:=/bin/bash

.PHONY: default
default: run

py-venv/bin/activate: requirements.txt
	rm -rf py-venv
	python3 -m venv py-venv
	source py-venv/bin/activate && \
	 pip3 install --upgrade pip
	source py-venv/bin/activate && \
	 pip3 install -r requirements.txt

.PHONY: run
run: py-venv/bin/activate archive-score.py
	source py-venv/bin/activate && \
	 python3 ./archive-score.py

.PHONY: clean
clean:
	rm -rf py-venv score.community
