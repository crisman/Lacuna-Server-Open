package Lacuna::Role::Ship::Arrive::CargoExchange;

use strict;
use Moose::Role;

after handle_arrival_procedures => sub {
    my ($self) = @_;
    if ($self->direction eq 'out') {
        $self->unload($self->payload, $self->foreign_body);
    }
    else {
        $self->unload($self->payload, $self->body);
    }
};

1;