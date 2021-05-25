#!/bin/bash

chosen=$(beet list -ap $1)

mpv --gapless-audio --term-osd-bar -no-resume-playback "$chosen"
