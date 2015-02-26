package Bio::Darkpan::Example;

# ABSTRACT: Choose your CPAN side of the force. Defaults to the dark side

=head1 SYNOPSIS

Testing feasibility of a darkpan with Pinto

=cut

use Moose;
use GD::Graph;

has 'force_side' => ( is => 'rw', isa => 'Str');
has 'year' => ( is => 'rw', isa => 'Str');
has 'day' => ( is => 'rw', isa => 'Str');
has 'month' => ( is => 'rw', isa => 'Str');
has 'hour' => ( is => 'rw', isa => 'Str');
has 'minute' => ( is => 'rw', isa => 'Str');

has '_force_balance_report' => ( is => 'rw', isa  => 'Str', lazy => 1, builder => '_build__force_balance_report' );
has 'store_report' => ( is => 'rw', isa => 'Str');

sub _build__force_balance_report {

    my ($self) = @_;
    my $force_balance_report = 'The force is stronger on the ' . $self->force_side;
    $force_balance_report .= ' side at ' . $self->day . '/' . $self->month . '/';
    $force_balance_report .= $self->year . ' - ' . $self->hour . ':' . $self->minute . "\n";
    $self->store_report($force_balance_report);

}


sub report_balance {

    my ($self) = @_;
    print( $self->_force_balance_report );

}


__PACKAGE__->meta->make_immutable;
no Moose;  
1;





