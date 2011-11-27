#!/usr/bin/env perl
use strict;
use warnings;
use Term::ANSIColor;

my $regex = shift @ARGV;

while(<>) {
  s/(${regex})/colored($+, 'cyan on_black')/eg;
  print $_;
}
