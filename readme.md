Template::Plugin::Calendar::Simple
==================================
Just another TT plugin for Calendar::Simple

Description
-----------

Synopsis
--------
```html
  [% USE cal = Calendar.Simple %]

  <table border="1">
    <tr>
    [% FOREACH day = cal.days %]
      <th>[% day %]</th>
    [% END %]
    </tr>
    [% FOREACH row = cal.rows %]
    <tr>
    [% FOREACH col = row %]
      <td>[% col || '&nbsp;' %]</td>
    [% END %]
    </tr>
  [% END %]
  </table>
```

Installation
------------
To install this module, you should use CPAN. A good starting
place is [How to install CPAN modules](http://www.cpan.org/modules/INSTALL.html).

If you truly want to install from this github repo, then
be sure and create the manifest before you test and install:
```
perl Makefile.PL
make
make manifest
make test
make install
```

Support and Documentation
-------------------------
After installing, you can find documentation for this module with the
perldoc command.
```
perldoc Template::Plugin::Calendar::Simple
```
You can also find documentation at [metaCPAN](https://metacpan.org/pod/Template::Plugin::Calendar::Simple).

License and Copyright
---------------------
See [source POD](/lib/Template/Plugin/Calendar/Simple.pm).
