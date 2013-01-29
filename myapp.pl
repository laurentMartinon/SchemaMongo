#!/usr/bin/env perl
use Mojolicious::Lite;
use MongoDB;
use MongoDB::OID;
# Documentation browser under "/perldoc"
plugin 'PODRenderer';

my $conn = MongoDB::Connection->new();
my @dbs = $conn->database_names;
use Data::Dumper;
print Dumper @dbs;

my $nb = keys(@dbs);
# foreach  (@dbs) {
#       print $_."\n";
#     }

# my $client = MongoDB::MongoClient->new;
# my $db = $client->get_database( 'test' );
# my $conn = MongoDB::Connection->new; 
# my $db = $conn->mydb || die "$!"; 
# my @cols = $db->collection_names;

# use Data::Dumper;
# print Dumper @cols;

my $nb = keys(@cols);
foreach  (@cols) {
      print $_."\n";
    }
  # /dbs
  get '/dbs' => sub {
    my $self = shift;
    my $content ="";
    foreach  (@dbs) {
      # $content .= "<li><a href="."/cols?db=".$_.">".$_."</a></li>";
      $content .= $_."\n";
    }
    # $content .="</ul>";  
    print $content;
    $self->stash(content => $content);
    $self->render('dbs');
  };

 # /cols?db=sri
 get '/cols' => sub {
    my $self = shift;
    my $content ="";
    my $param_db = $self->param('db');
    $self->render(text => "database : $param_db");
    # type boucle à utiliser pour les collection et documents
    # my $key;
    # my $value;
    # while (($key, $value) = each(%$data)){
    #       $content .= $key." | ".$value."    ";
    # }

    $self->stash(content => $content);
    $self->render('cols');
  };

  # /docs?col=sri
 get '/docs' => sub {
    my $self = shift;
    my $content ="";

    # type boucle à utiliser pour les collection et documents
    # my $key;
    # my $value;
    # while (($key, $value) = each(%$data)){
    #       $content .= $key." | ".$value."    ";
    # }
    
    $self->stash(content => $content);
    $self->render('docs');
  };

app->start;
__DATA__

@@ dbs.html.ep
% layout 'default';
% title 'ShemaMongoDB - databases';

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body>
      # % foreach my $element (@$content) {
      #   <li>
      #     <%= link_to $element => "path" %>
      #   </li>
      # % }
  	  <%= $content %>
  </body>
</html>

# @@ block.html.ep
#   % my $link = begin
#     % my ($url, $name) = @_;
#     Try <%= link_to $url => begin %><%= $name %><% end %>.
#   % end
#   <!DOCTYPE html>
#   <html>
#     <head><title>Sebastians frameworks</title></head>
#     <body>
#       %= $link->('http://mojolicio.us', 'Mojolicious')
#       %= $link->('http://catalystframework.org', 'Catalyst')
#     </body>
#   </html>

@@ cols.html.ep
% layout 'default';
% title 'ShemaMongoDB - collections';

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body>
     <%= $content %>
  </body>
</html>