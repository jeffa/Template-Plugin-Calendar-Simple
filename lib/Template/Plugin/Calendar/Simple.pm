package Template::Plugin::Calendar::Simple;

use strict;
use warnings;

use Calendar::Simple;

use Template::Plugin;
use Template::Iterator;
use Template::Exception;
use base qw( Template::Plugin );

our $VERSION = '0.04';

sub new {
	my ($class, $context, @arg) = @_;
	my @cal = Calendar::Simple::calendar(@arg);
	return bless {
		_CONTEXT => $context,
		rows     => Template::Iterator->new([@cal]),
		days     => [qw(Sun Mon Tue Wed Thu Fri Sat)],
	}, $class;
}

sub rows {
	my ($self) = @_;
	return $self->{rows};
}

sub days {
	my ($self, $mon) = @_;
	my @day = @{$self->{days}};
	push @day, shift @day if $mon;
	return [@day];
}

1;
__END__

=head1 NAME

Template::Plugin::Calendar::Simple - TT plugin for Calendar::Simple

=head1 SYNOPSIS

  [% USE cal = Calendar.Simple %]

  <table border="1">
  [% FOREACH row = cal.rows %]
     <tr>
     [% FOREACH col = row %]
        <td>[% col || '&nbsp;' %]</td>
     [% END %]
     </tr>
  [% END %]
  </table>

=head1 DESCRIPTION

This is a first stab at a Calendar::Simple plugin for Template Toolkit.

=head1 METHODS

=over 4

=item B<rows>

   [% FOREACH row = cal.rows %]

Returns a Template::Iterator which contains the calendar rows.
Each row, however, is simply an array.

=item B<days>

   [% FOREACH day = cal.days %]

Most calendars have a header with the days - this method returns
an array of abbreviated day names (currently only in English). If
any argument is passed, then the week day starts with Monday instead
of Sunday.

=back

=head1 BUGS

If you have found a bug, typo, etc. please visit Best Practical Solution's
CPAN bug tracker at http://rt.cpan.org:

E<lt>http://rt.cpan.org/NoAuth/Bugs.html?Dist=Template-Plugin-Calendar-SimpleE<gt>

or send mail to E<lt>bug-Template-Plugin-Calendar-Simple#rt.cpan.orgE<gt>

(you got this far ... you can figure out how to make that
a valid address ... and note that i won't respond to bugs
sent to my personal address any longer)

=head1 AUTHOR

Jeffrey Hayes Anderson

=head1 SEE ALSO

L<Template::Plugin>, L<Calendar::Simple>.

=head1 COPYRIGHT

Copyright (c) 2004 Jeffrey Hayes Anderson.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

=cut
