#!/bin/bash

set -eu

svn=~/must
project_dir=$svn/projects/coding
work_dir=$project_dir/dev/perl
script_dir=$work_dir/scripts

test_text_a=$project_dir/tmp/test_text_a.txt
test_text_b=$project_dir/tmp/test_text_b.txt

export PERL5LIB=$PERL5LIB:$work_dir/lib

for script in uppercase lowercase sort_unique sort_any randomize; do
  echo "#---------------------------------------------------------------------"
  echo "Executing script $script.pl"
  echo "#---------------------------------------------------------------------"
  set -x
  perl $script_dir/$script.pl $test_text_a $test_text_b
  #cat $test_text_a $test_text_b | perl $script_dir/$script.pl # script reads from STDIN so input can be piped
  set +x
  echo "#---------------------------------------------------------------------"
  echo ""
done

echo "#---------------------------------------------------------------------"
echo "Uppercase then sort unique.pl"
echo "#---------------------------------------------------------------------"
set -x
perl $script_dir/uppercase.pl $test_text_a $test_text_b | perl $script_dir/sort_unique.pl
set +x
echo "#---------------------------------------------------------------------"
