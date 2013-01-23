#!/usr/bin/env perl
use Mojolicious::Lite;
use MongoDB;
use MongoDB::OID;
# Documentation browser under "/perldoc"
plugin 'PODRenderer';

 my $client = MongoDB::MongoClient->new;
 my $db = $client->get_database( 'test' );
 my $events = $db->get_collection( 'events' )->find;

# my $myDocument = $events.hasNext() ? $events.next() : null;

# if ($myDocument) {
#    my $myName = $myDocument.name;
#    print (tojson(myName));
# }

  # @collections = $db->collection_names;
  # my @liste=('a','b');

  get '/' => sub {
  my $self = shift;
  # my $foo  = $self->param('foo');

  # while (my $doc = $events->next) {
  #       print $doc->{'name'};
  #   }
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'ShemaMongoDB';

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body>
  	 The magic numbers are  and <%= $two %>.
  </body>
</html>