package IO::Handle::unread;

use 5.008_001;
use strict;

use XSLoader;

our $VERSION = '0.01';

XSLoader::load(__PACKAGE__, $VERSION);

1;
__END__

=head1 NAME

IO::Handle::unread - Pushes string back into input filehandle

=head1 VERSION

This document describes IO::Handle::unread version 0.01

=head1 SYNOPSIS

    use IO::Handle::unread;

    *STDIN->unread("foo\n");
    print scalar <STDIN>; # => "foo\n"

=head1 DESCRIPTION

This module provdes C<IO::Handle> class with C<unread()>,
a superset of stdio's C<ungetc()>.

=head1 INTERFACE 

=head2 I<FILEHANDLE>->unread(string [, length])

Pushes string back into I<FILEHANDLE>, which is available for
subsequent read operations.

This method returns the unreaded byte length.

=head1 EXAMPLE

Here is an implementation of ungetc(), which deals with one-byte string.

	sub ungetc{
		my($in, $char) = @_;
		$in->unread($char, 1) == 1 ? $char : undef;
	}


=head1 CONFIGURATION AND ENVIRONMENT

IO::Handle::unread requires no configuration files or environment variables.

=head1 DEPENDENCIES

Perl 5.8.1 or later.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-io-handle-unread@rt.cpan.org/>, or through the web interface at
L<http://rt.cpan.org/>.

=head1 SEE ALSO

L<IO::Handle>.

L<perliol>.

=head1 AUTHOR

Goro Fuji E<lt>gfuji(at)cpan.orgE<gt>.

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, Goro Fuji E<lt>gfuji(at)cpan.orgE<gt>. Some rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut
