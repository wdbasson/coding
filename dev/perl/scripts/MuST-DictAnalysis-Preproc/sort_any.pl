#!/usr/bin/perl -w
use strict;
use warnings;
use MuST::DictAnalysis::Preproc qw(uppercase lowercase sort_unique sort_any randomize);

my @stdin=<>;

my @sorted=sort_any(@stdin);
print @sorted;
