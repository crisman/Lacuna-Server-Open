package Lacuna::Util;

use List::MoreUtils qw(any);
require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw(cname in randint);

sub cname {
    my $name = shift;
    my $cname = lc($name);
    $cname =~ s{\s+}{_}xmsg;
    return $cname;
}

sub in {
    my $value = shift;
    my @list;
    if (ref @_ eq 'ARRAY') {
        @list = @{$_[0]};
    }
    else {
        @list = @_;
    }
    return any { $_ eq $value } @list;
}

sub randint {
	my ($low, $high) = @_;
	$low = 0 unless defined $low;
	$high = 1 unless defined $high;
	($low, $high) = ($high,$low) if $low > $high;
	return $low + int( rand( $high - $low + 1 ) );
}

1;
