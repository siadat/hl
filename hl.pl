#!/usr/bin/env perl
use strict;
use warnings;
use Term::ANSIColor;
use Getopt::Std;

my %opts;
my $range_start = 0+'inf';
my $range_end = 0+'inf';
my $counter = 1;

getopts('vl:e:', \%opts);

my $lines = $opts{'l'} if exists $opts{'l'};
my $regex = $opts{'e'} if exists $opts{'e'};
my $invert = $opts{'v'} if exists $opts{'v'};

$lines ||= '';
$regex ||= '';
$invert ||= '';

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
    if ($regex and $_ =~ m/$regex/) {
      s/(.*)/colored($+, 'on_cyan')/e;
    } else {
      s/(.*)/colored($+, 'black on_yellow')/e;
    }
  } elsif($regex) {
    s/($regex)/colored($+, 'cyan')/eg;
  }

  $counter++;
  print $_;
}
