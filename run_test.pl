#!/usr/bin/perl

# Make python module sharing work
my @pypaths = split(":", $ENV{'PYTHONPATH'});
my $sharedpypath = `readlink -f "../shared/python"`;
chomp($sharedpypath);
push(@pypaths, $sharedpypath);
$ENV{'PYTHONPATH'} = join(":", @pypaths);

system('python -c "import epdb, random; random.seed(); port = random.randint(8100, 9000); epdb.serve(port=port);"');
