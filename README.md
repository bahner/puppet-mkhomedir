# mkhomedir

Welcome to your new module. A short overview of the generated parts can be found
in the [PDK documentation][1].

The README template below provides a starting point with details about what
information to include in your README.


### Description

mkhomedir will enable mkhomedir using oddjob. If you want to have
your hoemdir created when logging in to a system the first time,
just include this class
 
### Usage

Normally you just include the module to enable pam_oddjob_mkhomedir.so as so:

```puppet
  include mkhomedir
```

### Limitations

The module is limited to RedHat and Debian-family systems. It might well work
with other OS's that I don't know of, or have the possibility to test.

### Development

Pull requests are welcome. Issues as well.

2020-10-07: bahner