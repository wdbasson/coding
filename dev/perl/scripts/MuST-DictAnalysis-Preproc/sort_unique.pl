#!/usr/bin/perl -w
use strict;
use warnings;
use MuST::DictAnalysis::Preproc qw(uppercase lowercase sort_unique randomize);

my @stdin=<>;

my @unique=sort_unique(@stdin);
print @unique;
