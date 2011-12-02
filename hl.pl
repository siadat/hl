#!/usr/bin/env perl
use strict;
use warnings;
use Term::ANSIColor;
use Getopt::Std;

my %opts;
my $range_start = 0+'inf';
my $range_end = 0+'inf';
my $counter = 1;

my $regex = shift @ARGV;
getopts('vl:', \%opts);
my $lines = $opts{'l'};

while(<>) {
  if (grep(/\b$counter-/, $lines)) {
    $range_start = $counter;
    $range_end = 0+'inf';
  } elsif (grep(/-$counter\b/, $lines)) {
    $range_end = $counter;
  } elsif (grep(/\b$counter\b/, $lines)) {
    if($counter >= $range_start and $counter <= $range_end) {
    } else {
      $range_start = $counter;
      $range_end = $counter;
    }
  }

  if($counter >= $range_start and $counter <= $range_end) {
  # if($range_start and $counter >= $range_start and ((not $range_end) or $counter <= $range_end)) {
    if ($_ =~ m/${regex}/) {
      s/(.*)/colored($+, 'on_cyan')/e;
    } else {
      s/(.*)/colored($+, 'on_black')/e;
    }
  } else {
    s/(${regex})/colored($+, 'cyan')/eg;
  }

  $counter++;
  print $_;
}
