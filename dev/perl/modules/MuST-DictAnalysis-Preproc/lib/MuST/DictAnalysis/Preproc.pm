package MuST::DictAnalysis::Preproc;

use warnings;
use strict;
use Carp;

#use Moose; # takes care of creating a new() method for you
use open IO => ':encoding(utf8)';    # declare default layers utf8
use open ':std';    # converts the standard filehandles (STDIN, STDOUT,
                    # STDERR) to comply with encoding selected for
                    # input/output handles

#------------------------------------------------------------------------------
# Exporter wrapper to avoid runtime vs. compile-time trap
#------------------------------------------------------------------------------
# wdb: Object-oriented modules should export nothing
use Exporter::Easy (
  OK => [qw(uppercase lowercase sort_unique sort_any randomize)], );

# @ISA setup is automatic
# all assignments happen at compile time

# copied from: http://perldoc.perl.org/Exporter.html#Playing-Safe
#------------------------------------------------------------------------------

our $VERSION = '0.01';

# Module implementation here

sub uppercase {
  #my $self = shift; # Methods are always written to receive the object as their first argument:
  return map { uc } @_;
}

sub lowercase {
  return map { lc } @_;
}

sub sort_unique {
  my @parameters = @_;
  my %hash;
  foreach my $parameter (@parameters) {
    $hash{$parameter}++;
  }
  return ( sort keys %hash );
}

sub sort_any {
  return ( sort @_ );
}

sub randomize($@) {
  my ($seed, @input) = @_;
  if($seed) {
    srand($seed);
  }
  use List::Util 'shuffle';
  return shuffle @input;
}

1;    # Magic true value required at end of module
__END__

=head1 NAME

MuST::DictAnalysis::Preproc - [One line description of module's purpose here]

=head1 VERSION

This document describes MuST::DictAnalysis::Preproc version 0.0.1


=head1 SYNOPSIS

    use MuST::DictAnalysis::Preproc qw(uppercase lowercase sort_unique sort_any random);

    @uppercase_array=uppercase(<>);
    @lowercase_array=lowercase(<>);
    @unique=sort_unique(<>);
    @sorted=sort_any(<>);
    @random=randomize(<>);

    print @uppercase;
    print @lowercase;
    print @unique;
    print @sorted;
    print @random;
    ...



=head1 DESCRIPTION

=for author to fill in:
    Write a full description of the module and its features here.
    Use subsections (=head2, =head3) as appropriate.


=head1 INTERFACE

=for author to fill in:
    Write a separate section listing the public components of the modules
    interface. These normally consist of either subroutines that may be
    exported, or methods that may be called on objects belonging to the
    classes provided by the module.


=head1 DIAGNOSTICS

=for author to fill in:
    List every single error and warning message that the module can
    generate (even the ones that will "never happen"), with a full
    explanation of each problem, one or more likely causes, and any
    suggested remedies.

=over

=item C<< Error message here, perhaps with %s placeholders >>

[Description of error here]

=item C<< Another error message here >>

[Description of error here]

[Et cetera, et cetera]

=back


=head1 CONFIGURATION AND ENVIRONMENT

=for author to fill in:
    A full explanation of any configuration system(s) used by the
    module, including the names and locations of any configuration
    files, and the meaning of any environment variables or properties
    that can be set. These descriptions must also include details of any
    configuration language used.

MuST::DictAnalysis::Preproc requires no configuration files or environment variables.


=head1 DEPENDENCIES

=for author to fill in:
    A list of all the other modules that this module relies upon,
    including any restrictions on versions, and an indication whether
    the module is part of the standard Perl distribution, part of the
    module's distribution, or must be installed separately. ]

None.


=head1 INCOMPATIBILITIES

=for author to fill in:
    A list of any modules that this module cannot be used in conjunction
    with. This may be due to name conflicts in the interface, or
    competition for system or program resources, or due to internal
    limitations of Perl (for example, many modules that use source code
    filters are mutually incompatible).

None reported.


=head1 BUGS AND LIMITATIONS

=for author to fill in:
    A list of known problems with the module, together with some
    indication Whether they are likely to be fixed in an upcoming
    release. Also a list of restrictions on the features the module
    does provide: data types that cannot be handled, performance issues
    and the circumstances in which they may arise, practical
    limitations on the size of data sets, special cases that are not
    (yet) handled, etc.

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-must-dictanalysis-preproc@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

Willem Basson  C<< <wlmbasson@gmail.com> >>


=head1 LICENCE AND COPYRIGHT

Copyright (c) 2014, Willem Basson C<< <wlmbasson@gmail.com> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
