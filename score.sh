#!/bin/bash
dart pub get --no-precompile 2>/dev/null
dart test 2>&1
