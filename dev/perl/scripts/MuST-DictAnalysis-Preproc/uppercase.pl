#!/usr/bin/perl -w
use strict;
use warnings;
use MuST::DictAnalysis::Preproc qw(uppercase);

my @stdin=<>;

my @upper=uppercase(@stdin);
print @upper;
