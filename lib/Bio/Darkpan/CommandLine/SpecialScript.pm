package Bio::Darkpan::CommandLine::SpecialScript;

# ABSTRACT: Choose your CPAN force side. Defaults to the dark side

=head1 SYNOPSIS

Gets commandline arguments and does something with them

=cut

use Moose;
use Getopt::Long qw(GetOptionsFromArray);
use Cwd 'abs_path';
use Bio::Darkpan::Example;
use Capture::Tiny;
use File::Basename;
use File::Fetch;
use File::Copy;
use Data::Dumper;
use DateTime::Tiny;

has 'args'        => ( is => 'ro', isa => 'ArrayRef', required => 1 );
has 'side'        => ( is => 'rw', isa => 'Maybe[Str]', lazy => 1, default => 'Darkpan' );

sub BUILD {

  my ($self) = @_;

  my ($side, $lightsaber, $help);
  
  GetOptionsFromArray(
		      $self->args,
		      's|side=s' => \$side,
		      'h|help'      => \$help
		     );
  $self->side($side) if defined $side;
  die $self->usage_text if defined $help;

}


sub run {

  my ($self) = @_;
  my $now = DateTime::Tiny->now;
  my $force_balance = Bio::Darkpan::Example->new(
      force_side => $self->side,
      year       => $now->year,
      day        => $now->day,
      month      => $now->month,
      hour       => $now->hour,
      minute     => $now->minute
      );

  $force_balance->report_balance();




}
 
sub usage_text {
  print <<USAGE;

Testing feasibility of a darkpan
Usage: special_script -s <Force side>

Options:
-s  : the side of the force stronger with you
-h  : this message

USAGE
  exit;
}

__PACKAGE__->meta->make_immutable;
no Moose;  
1;
