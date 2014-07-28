#!/bin/bash
#
# Wrapper script to execute Perl scripts demonstrating functionality of the
# subroutines in the Preproc.pm module
#
# Author:  Willem Basson
# Email:   wlmbasson@gmail.com

set -eu

readonly SVN_DIR=~/must
readonly PROJECT_DIR=$SVN_DIR/projects/coding
readonly WORK_DIR=$PROJECT_DIR/dev/perl
readonly SCRIPT_DIR=$WORK_DIR/scripts/MuST-DictAnalysis-Preproc

readonly TEST_TEXT_A=$PROJECT_DIR/tmp/test_text_a.txt
readonly TEST_TEXT_B=$PROJECT_DIR/tmp/test_text_b.txt
# TODO (wdbasson): move test text to different dir

export PERL5LIB=$PERL5LIB:$WORK_DIR/lib

for script in uppercase lowercase sort_unique sort_any randomize; do
  echo "#---------------------------------------------------------------------"
  echo "Executing script $script.pl"
  echo "#---------------------------------------------------------------------"
  perl $SCRIPT_DIR/$script.pl $TEST_TEXT_A $TEST_TEXT_B
  echo "#---------------------------------------------------------------------"
  echo ""
done

echo "#---------------------------------------------------------------------"
echo "Uppercase then sort unique.pl"
echo "#---------------------------------------------------------------------"
perl $SCRIPT_DIR/uppercase.pl $TEST_TEXT_A $TEST_TEXT_B \
  | perl $SCRIPT_DIR/sort_unique.pl
echo "#---------------------------------------------------------------------"
