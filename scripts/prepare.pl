#!/usr/bin/perl -w

my %TITLES = (
    'index.html' => 'Sloop - Home',
    'faq.html' => 'Sloop - Frequently-asked questions',
    'publishing.html' => 'Sloop - Publishing data',
    );

my $outpage = $ENV{'OUTPAGE'};

my $title = $TITLES{$outpage};
if (!$title) {
    $title = $outpage;
}

while (<>) {
    s!<title>.*</title>!<title>$title</title>!;
    s!href="/$outpage"!!g;
    print;
}
