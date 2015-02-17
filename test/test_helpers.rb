#!/usr/bin/env ruby
# vim: et ts=2 sw=2

# Totally arbitrary GUID for this library
TEST_CLIENT_ID = "D25CD1BE-843C-46B1-B13F-D478FA9BD8D4"

# Consistent for a single test run, otherwise unique.
prefix = "Test #{Time.now.to_i}"
TEST_TITLE_A = "#{prefix}A"
TEST_TITLE_B = "#{prefix}B"

TEST_DATE = DateTime.new(2013, 2, 1, 6, 0)
