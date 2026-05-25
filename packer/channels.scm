(list (channel
    (name 'guix)
    ; I'd use this, but SH is down https://status.softwareheritage.org/pages/maintenance/578e5eddcdc0cc7951000520/6a0d821d817e4705f08c6fc4
    ;(url "https://codeberg.org/guix/guix.git")
    (url "https://github.com/Millak/guix.git")
    (commit "v1.4.0")
    (introduction (make-channel-introduction
   "9edb3f66fd807b096b48283debdcddccfea34bad"     ;2020-05-26
   (openpgp-fingerprint
    "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA")))))
