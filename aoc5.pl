#!/usr/bin/perl

use strict                ;
use warnings;
use 5.026;

# these are global so my subroutine can access them.
my $g_steps = 0;
my @input;

sub take_step{
  my $next = $_[0] + $input[$_[0]];
  $g_steps++;
  return $g_steps if ( $next > $#input); # if next is larger than the last index of the array, break off
  $input[$_[0]]++; # gotta increase the old value before leaving!
  take_step($next);
}

open my $fh,"<","aoc5_input" or die $!;

@input = <$fh>;

say take_step(0);
